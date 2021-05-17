# Copyright 2021 The Racklet Authors
# SPDX-License-Identifier: Apache-2.0

import iec60063
import itertools
import math

import quantities as q


class VoltageDivider:
    """
    Generate a resistor voltage divider.

    :param compute_v: function to use for computing the target voltage
    :param target_voltage: target voltage for the divider as determined by compute_v
    :param sum_min: minimum total resistance of the voltage divider
    :param sum_max: maximum total resistance of the voltage divider
    :param series: resistor series to use, one of iec60063.all_series
    :param minimum: should the given target voltage be treated as a minimum instead of maximum
    :param minimum_magnitude: the minimum magnitude (power of 10) to consider for candidate resistors
    :return: triple containing the final resistor values and resulting voltage
    """

    def __init__(self, compute_v, target_voltage, sum_min, sum_max, series, minimum=True, minimum_magnitude=0):
        self.compute_v = compute_v
        self.target_voltage = target_voltage
        self.sum_min = sum_min
        self.sum_max = sum_max
        self.series = series
        self.minimum = minimum
        self.minimum_magnitude = minimum_magnitude

    def compute(self, v):
        series = v[self.series]
        sum_max = v[self.sum_max].simplified.magnitude
        sum_min = v[self.sum_min].simplified.magnitude
        target_voltage = v[self.target_voltage].simplified.magnitude
        assert sum_max > sum_min

        resistances = []
        maximum_magnitude = math.floor(math.log10(sum_max)) + 1
        assert maximum_magnitude > self.minimum_magnitude
        for i in range(self.minimum_magnitude, maximum_magnitude):
            ohms = [float(n) * (10 ** i) * q.ohm for n in iec60063.get_series(series)]
            resistances += [n for n in ohms if n < sum_max]

        solution_found = False
        (best_voltage, best_r1, best_r2) = ((math.inf if self.minimum else -math.inf) * q.V, 0 * q.ohm, 0 * q.ohm)
        for r1, r2 in itertools.permutations(resistances, 2):
            r_sum = r1 + r2
            if r_sum > sum_max or r_sum < sum_min:
                continue
            voltage = self.compute_v(v, r1, r2)
            if (self.minimum and voltage < target_voltage) or (not self.minimum and voltage > target_voltage):
                continue
            if (self.minimum and voltage < best_voltage) or (not self.minimum and voltage > best_voltage):
                solution_found = True
                (best_voltage, best_r1, best_r2) = (voltage, r1, r2)
        assert solution_found
        v[id(self)] = (best_voltage, best_r1, best_r2)

    def retrieve(self, v, i):
        if not id(self) in v:
            self.compute(v)
        return v[id(self)][i]

    def voltage(self):
        return lambda v: self.retrieve(v, 0)

    def r1(self):
        return lambda v: self.retrieve(v, 1)

    def r2(self):
        return lambda v: self.retrieve(v, 2)
