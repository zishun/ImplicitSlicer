# Implicit and Direct Slicer for Lattice Structures (ImplicitSlicer)

- By: Qiang Zou (built on top of Charlie C.L. Wang's [MeshWorks](https://mewangcl.github.io/Projects/projMeshWorks.html))
- email: qzou.code@gmail.com
- webpage: https://qiang-zou.github.io/


## !important
The source code is for the method presented in

Shengjun Liu, Tao Liu, Qiang Zou, Weiming Wang, Eugeni L. Doubrovski, and Charlie C.L. Wang, "Memory-efficient modeling and slicing of large-scale adaptive lattice structures", ASME. J. Comput. Inf. Sci. Eng. December 2021; 21(6): 061003. https://doi.org/10.1115/1.4050290

It was developed with QT 5.10+MSVC 14.0 on the operating system Windows 10.

Now it works with QT 6.3 + Visual Studio 2022.



## Copyright
-----------

- ImplicitSlicer is developed by Qiang Zou based on [1-3] for research use. All rights about the program (esp. surface reconstruction) are reserved by Qiang Zou. This C++ source codes are available only to a primary user for academic purposes. No secondary use, such as copy, distribution, diversion, business purpose, etc., is allowed. In no event shall the author be liable to any party for direct, indirect, special, incidental, or consequential damage arising out of the use of this program. ImplicitSlicer is self-contained. 


## Build
----------

The original version on Windows+QT5.10+MSVS14.0 can be found at: https://github.com/Qiang-Zou/ImplicitSlicer/

The current version of QT6.3+VisualStudio2022 can be built with the following steps.

* ```git clone --recurse-submodules https://github.com/zishun/ImplicitSlicer.git```
* Open ```3DPrintPlanner.pro``` with Qt Creator and build.
* The built ```exe``` relies on several ```dll```s. Copy them as the structure below or add them to the system environment variable.
```
Build
├── release
│   ├── plugins
│   │   └── imageformats
│   │       └── qjpeg.dll
│   ├── 3DPrintPlanner.exe
│   ├── glew32.dll
│   ├── glut64.dll
│   ├── Qt6Core.dll
│   └── Qt6Gui.dll
└── debug/...
```

## Usage
-------

- After the compilation you can run the tool 3DPrintPlanner.exe inside the ```./Build/release/``` directory:

	- **Note** It is recommended to use the "Run in terminal" mode, not mandatory though.  
	- **Note** The data files should be located in the directory ```./Data```. Before using the tool, please unpack all model files to ```./Data``` in advance.  

- To slice a model, you can simply right-click in the GUI, and navigate to "Mesh -> Lattice Modeling". After that, you will be asked to input several necessary parameters like layer height through the terminal to run the program, and then the slicing will start working.

- For each layer, the contours are stored using the variable "result". You can add your customized processing code in the following section:

		// LatticeModeler.cpp
		line 399   auto result = msb.getContours(false);
		line 340   //.......................
			// do things with "result"
			
		line 343  //........................



## File format
-------------

- Edge file: lattice edge file (placed in ```./Data```, and any extension can be used).

	- line 1:	edge_number edge_radius convoluation_radius convoluation_kernel_size
	- lines 2-n:	x1 y1 z1 x2 y2 z2
	- **Note** x1 y1 z1: coordinates of one end point; x2 y2 z2: coordinates of the other end point


## References
-------------
- [1] Pu Huang, Charlie C.L. Wang, and Yong Chen, "Intersection-free and topologically faithful slicing of implicit solid", ASME Transactions - Journal of Computing and Information Science in Engineering, vol.13, no.2, 021009 (13 pages), June 2013. https://doi.org/10.1115/1.4024067
- [2] Shengjun Liu, Tao Liu, Qiang Zou, Weiming Wang, Eugeni L. Doubrovski, and Charlie C.L. Wang, "Memory-efficient modeling and slicing of large-scale adaptive lattice structures", ASME Transactions - Journal of Computing and Information Science in Engineering, December 2021; 21(6): 061003. https://doi.org/10.1115/1.4050290
- [3] Junhao Ding, Qiang Zou, Shuo Qu, Paulo Bartolo, Xu Song, Charlie C.L. Wang, STL-free design and manufacturing paradigm for high-precision powder bed fusion, CIRP Annals, 2021; 70(1): 167-170. https://doi.org/10.1016/j.cirp.2021.03.012
