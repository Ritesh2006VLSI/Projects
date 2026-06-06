Digital Clock using Verilog HDL
==============================

Overview
--------
This project implements a 24-hour digital clock using Verilog HDL with a structured, bottom-up design approach.  
The clock displays hours, minutes, and seconds and is designed using fully synchronous logic suitable for FPGA implementation.

The project was developed incrementally, starting from basic timing concepts and gradually building a complete time-keeping system. First, a clock divider was designed to generate a precise 1-second enable pulse from a high-frequency system clock. This enable pulse was then used to drive a seconds counter. The seconds counter generates a carry signal to increment the minutes counter, and similarly, the minutes counter generates a carry signal to increment the hours counter.

By cascading enable-based counters instead of using gated clocks or FSMs, the design maintains a single clock domain, ensuring clean timing, easy verification, and FPGA-friendly synthesis.

---

Design Architecture
-------------------
The digital clock uses cascaded counters driven by a clock divider.
```text
Clock Divider (1-second enable)
    |
    v
Seconds Counter (MOD-60)
    |
    v
Minutes Counter (MOD-60)
    |
    v
Hours Counter (MOD-24)
```
All modules operate on the same system clock and use synchronous reset.

---

Module Description
------------------

Clock Divider (clock_divider.v)
- Generates a 1-second enable pulse from the high-frequency system clock
- Implemented using a counter and comparator
- Produces a single-cycle tick signal for accurate time progression

Seconds Counter (seconds.v)
- MOD-60 counter (00–59)
- Increments on every 1-second enable pulse
- Generates a carry signal for the minutes counter

Minutes Counter (minutes.v)
- MOD-60 counter (00–59)
- Enabled by the seconds carry signal
- Generates a carry signal for the hours counter

Hours Counter (hours.v)
- MOD-24 counter (00–23)
- Enabled by the minutes carry signal
- Rolls over from 23 to 00

Top Module (digital_clock.v)
- Integrates all submodules
- Provides final outputs for hours, minutes, and seconds

---

Verification and Simulation
---------------------------
A complete testbench (tb_digital_clock.v) is provided to verify the correctness of the design.

The following scenarios were verified through simulation:
- Seconds rollover from 59 to 00
- Minutes increment on seconds overflow
- Hours increment on minutes overflow
- Full rollover from 23:59:59 to 00:00:00

To enable faster simulation, the clock divider count is reduced during simulation runs.  
Simulation waveforms and result screenshots are stored in the results/simulation directory.

---

Project Structure
-----------------
```text
Digital_Clock/
├── clock_divider.v
├── seconds.v
├── minutes.v
├── hours.v
├── digital_clock.v
├── tb_digital_clock.v
│
├── circuit/
│   ├── divider_minutes_box.png
│   ├── hour_second_box.png
│   └── overall_box.png
│
└── results/
    └── simulation/
        ├── waveform screenshots
        └── verification outputs
```
---

Key Design Features
-------------------
- Single clock domain
- Enable-based counter cascade
- No FSM usage
- Synchronous reset
- Modular and reusable structure
- FPGA synthesis friendly

---

Future Enhancements
-------------------
- BCD conversion
- 7-segment display interface
- Parameterized divider for simulation and hardware
- Alarm or stopwatch functionality

---

Tools Used
----------
- Verilog HDL
- Xilinx Vivado (simulation)

---

Author
------
Ritesh Kumar  