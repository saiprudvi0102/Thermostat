# VHDL Thermostat System

This project simulates a simple thermostat system using VHDL, with capabilities for heating and cooling control based on current and desired temperatures. It includes a testbench to verify the system behavior.

## 📁 Files

- `src/thermostat.vhdl`: Main thermostat module with input/output ports and internal logic.
- `src/t_thermostat.vhdl`: Testbench for simulating the thermostat under different temperature and control signal conditions.

## ⚙️ Features

- Registers and compares current and desired temperatures
- Switches between heating and cooling based on control inputs
- Displays selected temperature based on `display_select`
- Fully clock-driven synchronous design
- Simulated with toggleable clock signal every 5 ns

## 🧪 Testbench Stimulus

The testbench:
- Simulates temperature increase and decrease
- Toggles display selection
- Activates heating or cooling manually
- Verifies output signals `furnace_on`, `ac_on`, and `temp_display`

## 💡 Simulation Notes

Run the testbench with any VHDL simulator (e.g., ModelSim, GHDL) and observe waveform outputs for:
- Correct response of `furnace_on` and `ac_on`
- Output `temp_display` based on `display_select`

## 🛠️ Tools Used

- VHDL 2008
- Any VHDL simulator (ModelSim, GHDL, Vivado Simulator)

## 📜 License

This project is open-source. Add your license here if you want (e.g., MIT, Apache 2.0).

## ✍️ Author

- **Prudvi Ela**  
  📧 saiprudviela123@gmail.com  
  [LinkedIn](https://www.linkedin.com/in/prudvi0102)
