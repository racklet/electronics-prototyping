#!/usr/bin/env python3
# Copyright 2021 The Racklet Authors
# SPDX-License-Identifier: Apache-2.0

# Tool for computing component constants for the ROHM Semiconductor BD9E302EFJ.
# Component naming and computed values apply to the Application Example 2 (Fast load response)
# in https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator/bd9e302efj-e.pdf.

import itertools
import iec60063
import math
from tabulate import tabulate


def avg(*args):
    return sum(args) / len(args)


# BD9E constants
F_osc = 550000  # Hertz (this can't be changed)

# Variables
# TODO: Take these as command line arguments?
V_in = 24  # Volts, input voltage
A_max = 3  # Amperes, maximum output current
dI_L = 1.0  # Amperes, inductor ripple current
V_fb = 0.8  # Volts, feedback reference voltage
G_mp = 20  # A/V, current sense gain
G_ma = 140E-6  # A/V, error amplifier transconductance

# Output capacitor C_out specifications
C_C_out = 47E-6  # Farads, capacitance of C_out
R_C_out = 2E-3  # Ohms, equivalent series resistance of C_out

V_out_min = 5.1  # Volts, minimum voltage for V_out

R_div_max = 700E3  # 700 KOhm maximum from the specification
R_div_min = 500E3  # 500 KOhm minimum


def compute_V_out(dR1, dR2):
    return (dR1 + dR2) / dR2 * V_fb


def generate_resistors(multipliers):
    result = []
    for m in multipliers:
        result += [m * float(v) for v in iec60063.E96]
    return result


def resolve_V_out():
    resolved = False
    (b_voltage, b_R1, b_R2) = (math.inf, 0, 0)
    for d_R1, d_R2 in itertools.permutations(generate_resistors([10000, 100000]), 2):
        d_sum = d_R1 + d_R2
        if d_sum > R_div_max or d_sum < R_div_min:
            continue
        value = compute_V_out(d_R1, d_R2)
        if value < V_out_min:
            continue
        if value < b_voltage:
            resolved = True
            (b_voltage, b_R1, b_R2) = (value, d_R1, d_R2)
    assert resolved
    return b_voltage, b_R1, b_R2


V_out, R1, R2 = resolve_V_out()

# Enable fast load response
fast_response = True

# According to the datasheet F_crs should typically be around 20 KHz. For
# the two fast load response application examples it has been set to around
# 24 KHz, and for the two others it is around 16 Khz (reverse-engineered
# from the equation for the phase compensation resistor R3).
F_crs = 24000 if fast_response else 16000  # Hertz

# The datasheet recommends inserting a zero point under 1/6 of F_crs.
# All application examples use a 6.8 nF capacitance for C2, based on
# which the actual multipliers are roughly 1/12 with fast load response
# and 1/6 without.
F_z = (1/12 if fast_response else 1 / 6) * F_crs


# Inductance of the external inductor L
def L_inductance():
    if V_out * 2 > V_in:
        return V_in / (4 * F_osc * dI_L)  # Alternate calculation from the datasheet
    return V_out * (V_in - V_out) * 1 / (V_in * F_osc * dI_L)


def L_saturation_A_min():
    return A_max + 0.5 * dI_L


def voltage_ripple():
    return dI_L * (R_C_out + 1 / (8 * C_C_out * F_osc))


def R3_resistance():
    return 2 * math.pi * V_out * F_crs * C_C_out / (V_fb * G_mp * G_ma)


def C1_capacitance():
    return 1 / (2 * math.pi * R1 * 20000)


def C2_capacitance():
    return min(1 / (2 * math.pi * R3_resistance() * F_z), 15E-9)  # Upper limit from the datasheet


def sub(s):
    return f"<sub>{s}</sub>"


def table_format(d):
    return tabulate(d, headers=["Parameter", "Value"], tablefmt="github")


configuration = [
    ["Frequency", F_osc],
    ["Input voltage", V_in],
    ["Maximum current", A_max],
    ["Ripple current", dI_L],
    ["Feedback reference V", V_fb],
    ["Current sense gain", G_mp],
    ["Error amp transconductance", G_ma],
    [f"C{sub('out')} capacitance", C_C_out],
    [f"C{sub('out')} ESR", R_C_out],
    [f"Minimum V{sub('out')}", V_out_min],
    ["Fast load response", fast_response],
    [f"F{sub('CRS')} frequency", F_crs],
    [f"F{sub('Z')} frequency", F_z],
]

computed = [
    ["Output voltage", V_out],
    ["L inductance", L_inductance()],
    ["L saturation A min", L_saturation_A_min()],
    ["Voltage ripple", voltage_ripple()],
    [f"C{sub(1)} capacitance", C1_capacitance()],
    [f"C{sub(2)} capacitance", C2_capacitance()],
    [f"R{sub(1)} resistance", R1],
    [f"R{sub(2)} resistance", R2],
    [f"R{sub(1)} + R{sub(2)}", R1 + R2],
    [f"R{sub(3)} resistance", R3_resistance()],
]

print("Configured input values:")
print(table_format(configuration))
print()
print("Computed results:")
print(table_format(computed))
