# XYZ-public Control code for an XYZ cartesian stage robot

## Parker XYZ Code Explanation

This folder contains the code required to run base functionality for the Parker XYZ Cartesian robot. This document will explain the basic layout of the folders and recommendations for use.

## Model Folder
This folder contains the Simulink realtime model, made in MATLAB 2016a. The model is called “slrt_parker.slx” and contains all the base functions of the Parker XYZ. The code is separated according to what you would expect in a control loop: a trajectory planner, a low level controller, and a plant that communicates with the hardware. There is also a “scope” block to allow real-time data visualization and data logging as well as a “motor enable” subsystem that does what it implies. The piece of the code that is most likely to require adjustments is the “plant” block if any of your hardware interfaces are different. 

The model should be built using the “MAKE_PARKER.m” function, which will make sure the model is built inside the build folder and that all dependencies are added to the path.

The function “PARKER_DEPENDENCY.m” makes sure all the dependencies are added to the MATLAB path. This function must be changed to match the model path on your computer. In other versions, we have used environment variables so that code is more portable on different computers (MATLAB commands getenv and setenv are useful here), but that is not necessary and isn’t implemented in this version of the code.

## Init Folder
The Init folder has all the initialization code: the most important piece is the hardware specs for the robot and force sensor, contained in “Parker_Multi_Axis_Init” and “Parker_ATI_init”. The former also contains the low-level controller’s parameters.

## GUI Folder
For basic control of the robot, use the GUI contained in this folder. Run “GUI_ParkerXYZ.m” to load the GUI. There are, like in “PARKER_DEPENDENCY.m”, references here to your model path: make sure the model path reference matches the location on your computer. We have used guide to create and edit this GUI [use matlab command guide('GUI_ParkerXYZ') to add new things/edit the GUI].
##  FilescopeData Folder
Contains functions that allow you to turn on filescope data logging, which is then saved to the “Data/Filescope” folder
## Experiment Folder
Contains experiment scripts (self-explanatory). I left in a basic example script for reference.
## ControlFunc Folder
Contains necessary subfunctions for editing model parameters and running the robot. parkerGoTo, parkerStop, parkerGetPcur, parkerGetForceSensor are among the most useful. Note: parker setJoint is a subfunction of parkerGoTo, don’t use it directly.
## Data Folder
Doesn’t do anything, just useful to have a place to store things taken during experiments
## Git Ignore File
If you want to set up this model for a git repository, this ignore will makes it a lot smaller by ignoring the data folder and the build folder (which is really large).
