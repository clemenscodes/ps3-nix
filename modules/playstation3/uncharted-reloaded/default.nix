{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
with lib;
  {config, ...}: let
    cfg = config.playstation3.uncharted-reloaded;
  in {
    options = {
      playstation3 = {
        uncharted-reloaded = {
          enable = mkEnableOption "Enable settings in RPCS3 for Uncharted Reloaded" // {default = false;};
          iso = mkOption {
            type = types.package;
            default = null;
            description = "The Uncharted 3 ISO to be used for RPCS3";
          };
        };
      };
    };
    config = mkIf (cfg.enable) {
      home = {
        file = {
          ".config/rpcs3/games.yml" = {
            text = ''
              BCES01670: /mnt/games/BCES01670/
            '';
          };
          ".config/rpcs3/patches/patch.yml" = {
            source = ./patches/patch.yml;
          };
          ".config/rpcs3/patch_config.yml" = {
            text = ''
              PPU-02a88c3c6cd415b0bb81f1606bc743835881a4ba:
                Enable GPU Lighting:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable Motion Blur:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Performance (WCB):
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Enable LAN Mode:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable Camera Shake:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable in-built MLAA:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Unlock FPS:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable Bloom:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable Mesh Trimming:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable SSAO:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Depth Border Fix:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Disable Depth of Field:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Skip Intro:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Heat waves Approximate ZCull fix:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
                Depth Buffer Viewport:
                  "Uncharted 3: Drake's Deception":
                    BCES01670:
                      01.19:
                        Enabled: true
            '';
          };
          ".config/rpcs3/custom_configs/config_BCES01670.yml" = {
            text = ''
              Core:
                PPU Decoder: Recompiler (LLVM)
                PPU Threads: 2
                PPU Debug: false
                PPU Calling History: false
                Save LLVM logs: false
                Use LLVM CPU: ""
                Max LLVM Compile Threads: 0
                PPU LLVM Greedy Mode: false
                LLVM Precompilation: true
                Thread Scheduler Mode: Operating System
                Set DAZ and FTZ: false
                SPU Decoder: Recompiler (LLVM)
                SPU Reservation Busy Waiting Percentage: 0
                SPU GETLLAR Busy Waiting Percentage: 100
                SPU Debug: false
                MFC Debug: false
                Preferred SPU Threads: 0
                SPU delay penalty: 3
                SPU loop detection: true
                Max SPURS Threads: 6
                SPU Block Size: Safe
                Accurate SPU DMA: false
                Accurate SPU Reservations: true
                Accurate Cache Line Stores: false
                Accurate RSX reservation access: true
                RSX FIFO Accuracy: Atomic
                SPU Verification: true
                SPU Cache: true
                SPU Profiler: false
                MFC Commands Shuffling Limit: 0
                MFC Commands Timeout: 0
                MFC Commands Shuffling In Steps: false
                Enable TSX: Disabled
                XFloat Accuracy: Approximate
                Accurate PPU 128-byte Reservation Op Max Length: 0
                Stub PPU Traps: 0
                Full Width AVX-512: true
                PPU LLVM Java Mode Handling: true
                Use Accurate DFMA: true
                PPU Set Saturation Bit: false
                PPU Accurate Non-Java Mode: false
                PPU Fixup Vector NaN Values: false
                PPU Accurate Vector NaN Values: false
                PPU Set FPCC Bits: false
                Debug Console Mode: false
                Hook static functions: false
                Libraries Control:
                  - libavcdec.sprx:hle
                  - libssl.sprx:hle
                  - libvdec.sprx:lle
                HLE lwmutex: false
                SPU LLVM Lower Bound: 0
                SPU LLVM Upper Bound: 18446744073709551615
                TSX Transaction First Limit: 800
                TSX Transaction Second Limit: 2000
                Clocks scale: 100
                SPU Wake-Up Delay: 0
                SPU Wake-Up Delay Thread Mask: 63
                Max CPU Preempt Count: 0
                Allow RSX CPU Preemptions: true
                Sleep Timers Accuracy: All Timers
                Usleep Time Addend: 0
                Performance Report Threshold: 500
                Enable Performance Report: false
                Assume External Debugger: false
              VFS:
                Enable /host_root/: false
                Initialize Directories: true
                Limit disk cache size: false
                Disk cache maximum size (MB): 5120
                Empty /dev_hdd0/tmp/: true
              Video:
                Renderer: Vulkan
                Resolution: 1280x720
                Aspect ratio: 16:9
                Frame limit: Auto
                Second Frame Limit: 0
                MSAA: Disabled
                Shader Mode: Async Shader Recompiler
                Shader Precision: High
                Write Color Buffers: true
                Write Depth Buffer: false
                Read Color Buffers: true
                Read Depth Buffer: false
                Handle RSX Memory Tiling: true
                Log shader programs: false
                VSync: false
                Debug output: false
                Debug overlay: false
                Renderdoc Compatibility Mode: false
                Use GPU texture scaling: false
                Stretch To Display Area: false
                Force High Precision Z buffer: false
                Strict Rendering Mode: false
                Disable ZCull Occlusion Queries: false
                Disable Video Output: false
                Disable Vertex Cache: false
                Disable FIFO Reordering: false
                Enable Frame Skip: false
                Force CPU Blit: false
                Disable On-Disk Shader Cache: false
                Disable Vulkan Memory Allocator: false
                Use full RGB output range: true
                Strict Texture Flushing: false
                Multithreaded RSX: true
                Relaxed ZCULL Sync: false
                Force Hardware MSAA Resolve: false
                3D Display Mode: Disabled
                Debug Program Analyser: false
                Accurate ZCULL stats: false
                Consecutive Frames To Draw: 1
                Consecutive Frames To Skip: 1
                Resolution Scale: 150
                Anisotropic Filter Override: 0
                Texture LOD Bias Addend: 0
                Minimum Scalable Dimension: 16
                Shader Compiler Threads: 0
                Driver Recovery Timeout: 1000000
                Driver Wake-Up Delay: 400
                Vblank Rate: 60
                Vblank NTSC Fixup: false
                DECR memory layout: false
                Allow Host GPU Labels: false
                Disable MSL Fast Math: false
                Output Scaling Mode: Bilinear
                Vulkan:
                  Adapter: AMD Radeon RX 7900 XTX
                  Force FIFO present mode: false
                  Force primitive restart flag: false
                  Exclusive Fullscreen Mode: Automatic
                  Asynchronous Texture Streaming 2: true
                  FidelityFX CAS Sharpening Intensity: 50
                  Asynchronous Queue Scheduler: Safe
                  VRAM allocation limit (MB): 65536
                Performance Overlay:
                  Enabled: false
                  Enable Framerate Graph: false
                  Enable Frametime Graph: false
                  Framerate datapoints: 50
                  Frametime datapoints: 170
                  Detail level: Medium
                  Framerate graph detail level: All
                  Frametime graph detail level: All
                  Metrics update interval (ms): 350
                  Font size (px): 10
                  Position: Top Left
                  Font: n023055ms.ttf
                  Horizontal Margin (px): 50
                  Vertical Margin (px): 50
                  Center Horizontally: false
                  Center Vertically: false
                  Opacity (%): 70
                  Body Color (hex): "#FFE138FF"
                  Body Background (hex): "#002339FF"
                  Title Color (hex): "#F26C24FF"
                  Title Background (hex): "#00000000"
                Shader Loading Dialog:
                  Allow custom background: true
                  Darkening effect strength: 30
                  Blur effect strength: 0
              Audio:
                Renderer: Cubeb
                Audio Provider: CellAudio
                RSXAudio Avport: HDMI 0
                Dump to file: false
                Convert to 16 bit: false
                Audio Format: Stereo
                Audio Formats: 0
                Audio Channel Layout: Automatic
                Audio Device: "@@@default@@@"
                Master Volume: 100
                Enable Buffering: true
                Desired Audio Buffer Duration: 100
                Enable Time Stretching: false
                Disable Sampling Skip: false
                Time Stretching Threshold: 75
                Microphone Type: "Null"
                Microphone Devices: "@@@@@@@@@@@@"
                Music Handler: Qt
              Input/Output:
                Keyboard: "Null"
                Mouse: Basic
                Camera: "Null"
                Camera type: Unknown
                Camera flip: None
                Camera ID: Default
                Move: "Null"
                Buzz emulated controller: "Null"
                Turntable emulated controller: "Null"
                GHLtar emulated controller: "Null"
                Pad handler mode: Single-threaded
                Keep pads connected: false
                Pad handler sleep (microseconds): 1000
                Background input enabled: true
                Show move cursor: false
                Lock overlay input to player one: false
                Emulated Midi devices: Keyboardßßß@@@Keyboardßßß@@@Keyboardßßß@@@
                Load SDL GameController Mappings: true
                IO Debug overlay: false
              System:
                License Area: SCEA
                Language: English (US)
                Keyboard Type: English keyboard (US standard)
                Enter button assignment: Enter with cross
                Console time offset (s): 0
                System Name: RPCS3-791
                PSID high: 0
                PSID low: 0
                HDD Model Name: ""
                HDD Serial Number: ""
              Net:
                Internet enabled: Connected
                IP address: 0.0.0.0
                Bind address: 0.0.0.0
                DNS address: 135.125.75.123
                IP swap list: ""
                UPNP Enabled: true
                PSN status: RPCN
                PSN Country: de
              Savestate:
                Start Paused: false
                Suspend Emulation Savestate Mode: false
                Compatible Savestate Mode: false
                Inspection Mode Savestates: false
                Save Disc Game Data: false
              Miscellaneous:
                Automatically start games after boot: true
                Exit RPCS3 when process finishes: false
                Pause emulation on RPCS3 focus loss: false
                Start games in fullscreen mode: true
                Prevent display sleep while running games: true
                Show trophy popups: true
                Show shader compilation hint: true
                Show PPU compilation hint: true
                Show pressure intensity toggle hint: true
                Show analog limiter toggle hint: true
                Show mouse and keyboard toggle hint: true
                Use native user interface: true
                GDB Server: 127.0.0.1:2345
                Silence All Logs: false
                Window Title Format: "FPS: %F | %R | %V | %T [%t]"
                Pause Emulation During Home Menu: false
              Log: {}
            '';
          };
          ".config/rpcs3/input_configs/BCES01670/Default.yml" = {
            text = ''
              Player 1 Input:
                Handler: DualShock 3
                Device: "DS3 Pad #1"
                Config:
                  Left Stick Left: LS X-
                  Left Stick Down: LS Y-
                  Left Stick Right: LS X+
                  Left Stick Up: LS Y+
                  Right Stick Left: RS X-
                  Right Stick Down: RS Y-
                  Right Stick Right: RS X+
                  Right Stick Up: RS Y+
                  Start: Start
                  Select: Select
                  PS Button: PS Button
                  Square: Square
                  Cross: Cross
                  Circle: Circle
                  Triangle: Triangle
                  Left: Left
                  Down: Down
                  Right: Right
                  Up: Up
                  R1: R1
                  R2: R2
                  R3: R3
                  L1: L1
                  L2: L2
                  L3: L3
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 40
                  Right Stick Deadzone: 40
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 0
                  Right Pad Squircling Factor: 0
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 1356
                  Product ID: 616
                Buddy Device: ""
              Player 2 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
              Player 3 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
              Player 4 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
              Player 5 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
              Player 6 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
              Player 7 Input:
                Handler: "Null"
                Device: "Null"
                Config:
                  Left Stick Left: ""
                  Left Stick Down: ""
                  Left Stick Right: ""
                  Left Stick Up: ""
                  Right Stick Left: ""
                  Right Stick Down: ""
                  Right Stick Right: ""
                  Right Stick Up: ""
                  Start: ""
                  Select: ""
                  PS Button: ""
                  Square: ""
                  Cross: ""
                  Circle: ""
                  Triangle: ""
                  Left: ""
                  Down: ""
                  Right: ""
                  Up: ""
                  R1: ""
                  R2: ""
                  R3: ""
                  L1: ""
                  L2: ""
                  L3: ""
                  IR Nose: ""
                  IR Tail: ""
                  IR Left: ""
                  IR Right: ""
                  Tilt Left: ""
                  Tilt Right: ""
                  Motion Sensor X:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Y:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor Z:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Motion Sensor G:
                    Axis: ""
                    Mirrored: false
                    Shift: 0
                  Pressure Intensity Button: ""
                  Pressure Intensity Percent: 50
                  Pressure Intensity Toggle Mode: false
                  Pressure Intensity Deadzone: 0
                  Analog Limiter Button: ""
                  Analog Limiter Toggle Mode: false
                  Left Stick Multiplier: 100
                  Right Stick Multiplier: 100
                  Left Stick Deadzone: 0
                  Right Stick Deadzone: 0
                  Left Stick Anti-Deadzone: 0
                  Right Stick Anti-Deadzone: 0
                  Left Trigger Threshold: 0
                  Right Trigger Threshold: 0
                  Left Pad Squircling Factor: 8000
                  Right Pad Squircling Factor: 8000
                  Color Value R: 0
                  Color Value G: 0
                  Color Value B: 0
                  Blink LED when battery is below 20%: true
                  Use LED as a battery indicator: false
                  LED battery indicator brightness: 50
                  Player LED enabled: true
                  Enable Large Vibration Motor: true
                  Enable Small Vibration Motor: true
                  Switch Vibration Motors: false
                  Mouse Movement Mode: Relative
                  Mouse Deadzone X Axis: 60
                  Mouse Deadzone Y Axis: 60
                  Mouse Acceleration X Axis: 200
                  Mouse Acceleration Y Axis: 250
                  Left Stick Lerp Factor: 100
                  Right Stick Lerp Factor: 100
                  Analog Button Lerp Factor: 100
                  Trigger Lerp Factor: 100
                  Device Class Type: 0
                  Vendor ID: 0
                  Product ID: 0
                Buddy Device: "Null"
            '';
          };
        };
      };
    };
  }
