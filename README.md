# Batman Loadout Selection FSM using Verilog HDL

## Overview

This project implements a custom Finite State Machine (FSM) in Verilog HDL that simulates Batman selecting a mission loadout. The user can navigate through available vehicles and weapons using control inputs and confirm the final loadout selection.

The design demonstrates FSM concepts including state encoding, state transitions, output decoding, and storage of selected options.

---

## Features

- Moore FSM architecture
- 7-state custom state machine
- Vehicle selection system
- Weapon selection system
- Loadout confirmation state
- Stores selected vehicle and weapon
- Verilog RTL implementation
- Functional simulation and waveform verification

---

## State Encoding

| State | Encoding |
|---------|---------|
| IDLE | 000 |
| BAT_MOBILE | 001 |
| BAT_WING | 010 |
| BAT_BOAT | 011 |
| BATARANG | 100 |
| SMOKE_BOMB | 101 |
| CONFIRM | 110 |

---

## Inputs

| Signal | Description |
|----------|-------------|
| clk | System Clock |
| reset | Asynchronous Reset |
| next | Navigate through available options |
| select | Select current option |

---

## Outputs

| Signal | Description |
|----------|-------------|
| idle | Indicates IDLE state |
| bat_mobile | Indicates BAT_MOBILE state |
| bat_wing | Indicates BAT_WING state |
| bat_boat | Indicates BAT_BOAT state |
| batarang | Indicates BATARANG state |
| smoke_bomb | Indicates SMOKE_BOMB state |
| loadout_ready | Indicates CONFIRM state |
| vehicle_selected | Stores selected vehicle |
| weapon_selected | Stores selected weapon |
| state_out | Current FSM state |

---

## Vehicle Selection

| Vehicle | Stored Value |
|----------|-------------|
| BAT_MOBILE | 01 |
| BAT_WING | 10 |
| BAT_BOAT | 11 |

---

## Weapon Selection

| Weapon | Stored Value |
|---------|-------------|
| BATARANG | 0 |
| SMOKE_BOMB | 1 |

---

## Example Selection Flow

```text
IDLE
  ↓
BAT_MOBILE
  ↓ NEXT
BAT_WING
  ↓ SELECT
BATARANG
  ↓ NEXT
SMOKE_BOMB
  ↓ SELECT
CONFIRM
```

Final Loadout:

```text
Vehicle : BAT_WING
Weapon  : SMOKE_BOMB
Status  : LOADOUT READY
```

---

## Design Methodology

The FSM is implemented using the standard three-block FSM architecture:

### 1. State Register

Updates the current state on every clock edge and handles asynchronous reset.

### 2. Next-State Logic

Determines the next state based on the current state and user inputs (`next` and `select`).

### 3. Output Logic

Generates outputs corresponding to each state and stores the selected vehicle and weapon.

---

## Project Structure

```text
BATMAN_LOADOUT_FSM
│
├── RTL DESIGN
│   └── BATMAN_LOADOUT.v
│
├── TESTBENCH
│   └── tb_batman_loadout.v
│
├── STATE DIAGRAM
│   └── state_diagram.jpeg
│
├── SIMULATION
│   ├── state_diagram.jpeg
│   └── waveform.png
│
└── README.md
```

---

## Simulation Results

The FSM was verified using a dedicated Verilog testbench.

Simulation successfully demonstrates:

- Vehicle navigation
- Vehicle selection
- Weapon navigation
- Weapon selection
- Confirmation of final loadout
- Storage of selected vehicle and weapon


```text
SIMULATION/waveform.png
```

---

## Learning Outcomes

Through this project, the following concepts were practiced:

- Finite State Machines (FSMs)
- State Encoding
- Moore Machine Design
- Next-State Logic
- Sequential Logic Design
- Combinational Logic Design
- Verilog HDL Coding
- Testbench Development
- Functional Verification
- Simulation Analysis

---

## Author

Madhu Visagan H T

Digital VLSI | RTL Design | Verilog HDL
