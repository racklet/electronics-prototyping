# Copyright 2021 The Racklet Authors
# SPDX-License-Identifier: Apache-2.0

import lazydict
from quantities import Quantity


# Integrated Circuit Component Configurator (iccc) is a tool to help with computing
# correct values for external components of various integrated circuits. An integrated
# circuit should be represented as a class that inherits IC and fills in the valuations.
# See the implementation for ROHM's BD9E302EFJ (bd9e302efj.py) as an example.

class IC:
    # Named valuations (components properties, voltages, currents) for the IC
    valuations = {}

    def __init__(self, external_variables):
        self.evaluated = lazydict.LazyDictionary(self.valuations)
        self.evaluated.update(external_variables)


class Component(Quantity):
    def __new__(cls, data, unit, series, round_up, dtype=None, copy=True):
        if isinstance(data, Quantity):
            # We need to drop units here since datasheet formulas might not
            # necessarily be "mathematically valid" wrt. the quantities.
            data = data.simplified.magnitude
        cls.series = series
        cls.round_up = round_up
        return super().__new__(cls, data, unit, dtype, copy)

    # TODO: __str__ that automatically resolves micro, nano, pico...
