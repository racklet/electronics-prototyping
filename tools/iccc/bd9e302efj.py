#!/usr/bin/env python3
# Copyright 2021 The Racklet Authors
# SPDX-License-Identifier: Apache-2.0

# Tool for computing component constants for the ROHM Semiconductor BD9E302EFJ.
# Component naming and computed values apply to the Application Example 2 (Fast load response)
# in https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator/bd9e302efj-e.pdf.

import math

from iccc import IC, Component
from quantities import Quantity
from util import VoltageDivider

# Common IEC60063 series for components
series = "E96"


class BD9E302EFJ(IC):
    target_voltage_div = VoltageDivider(
        lambda v, r1, r2: (r1 + r2) / r2 * v['V_fb'],
        "V_tgt", "R_dmin", "R_dmax", "R_div series", minimum_magnitude=4
    )

    valuations = {
        "L": lambda v: Component(
            # Conditional alternate calculation from the datasheet
            v["V_in"] / (4 * v["F_osc"] * v["dI_l"]) if v["V_out"] * 2 > v["V_in"] else
            v["V_out"] * (v["V_in"] - v["V_out"]) * 1 / (v["V_in"] * v["F_osc"] * v["dI_l"]),
            "H", series, True
        ),
        "L saturation min": lambda v: v["A_max"] + 0.5 * v["dI_l"],
        "Voltage ripple": lambda v: (v["dI_l"] * (v["C_out ESR"] + 1 /
                                                  (8 * v["C_out CAP"] * v["F_osc"]))).rescale("mV"),
        "V_out": target_voltage_div.voltage(),
        "R1": target_voltage_div.r1(),
        "R2": target_voltage_div.r2(),
        "R3": lambda v: Component(2 * math.pi * v["V_out"] * v["F_crs"] * v["C_out CAP"] /
                                  (v["V_fb"] * v["G_mp"] * v["G_ma"]), "ohm", series, True),
        "C1": lambda v: Component(1 / (2 * math.pi * v["R1"] * 20000), "F", series, True),
        "C2": lambda v: Component(min(1 / (2 * math.pi * v["R3"] * v["F_z"]), 15E-9), "F", series, True),
    }


if __name__ == "__main__":
    # TODO: Replace Quantity with q.<unit>
    config = {
        "F_osc": Quantity(550E3, "Hz"),  # This is a constant in the BD9E302EFJ
        "V_in": Quantity(24, "V"),  # Input voltage
        "A_max": Quantity(3, "A"),  # Maximum output current
        "dI_l": Quantity(1, "A"),  # Inductor ripple current
        "V_fb": Quantity(0.8, "V"),  # Feedback reference voltage
        "G_mp": Quantity(20, "A/V"),  # Current sense gain
        "G_ma": Quantity(140E-6, "A/V"),  # Error amplifier transconductance
        "C_out CAP": Quantity(47E-6, "F"),  # Capacitance of C_out
        "C_out ESR": Quantity(2E-3, "ohm"),  # Equivalent series resistance of C_out
        "V_tgt": Quantity(5.1, "V"),  # Lower bound of the target voltage
        "R_dmin": Quantity(500E3, "ohm"),  # Minimum resistance of the voltage divider
        "R_dmax": Quantity(700E3, "ohm"),  # Maximum resistance of the voltage divider (specified in datasheet)
        "R_div series": "E96",  # The resistor series to use in the voltage divider
    }

    # Optimize for fast load response
    fast_response = True

    # According to the datasheet F_crs should typically be around 20 KHz. For
    # the two fast load response application examples it has been set to around
    # 24 KHz, and for the two others it is around 16 Khz (reverse-engineered
    # from the equation for the phase compensation resistor R3).
    config["F_crs"] = Quantity(24000 if fast_response else 16000, "Hz")

    # The datasheet recommends inserting a zero point under 1/6 of F_crs.
    # All application examples use a 6.8 nF capacitance for C2, based on
    # which the actual multipliers are roughly 1/12 with fast load response
    # and 1/6 without.
    config["F_z"] = (1 / 12 if fast_response else 1 / 6) * config["F_crs"]

    ic = BD9E302EFJ(config)
    for k in ic.valuations.keys():
        print(f"{k}: {ic.evaluated[k]}")
