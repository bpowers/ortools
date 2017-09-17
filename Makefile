
ORTOOLS = /home/bpowers/src/or-tools
#SWIG = $(ORTOOLS)/dependencies/install/bin/swig
SWIG = swig

# 		-I$(ORTOOLS)/dependencies/install/include \


all:
	$(SWIG) \
		-I/usr/include/ortools \
		-DUSE_CLP -DUSE_CBC -DUSE_GLOP -DUSE_BOP \
		-I$(ORTOOLS) \
		-c++ -go -cgo -intgosize 64 \
		-o linear_solver_go_wrap.cc -module ortools \
		wrapper/linear_solver.swig
	perl -pi -e 's|#define intgo swig_intgo|#cgo CXXFLAGS: -std=c++0x -fwrapv -O4 -DNDEBUG -I/usr/include/ortools -I$(ORTOOLS)/examples -I$(ORTOOLS)/src/gen -I$(ORTOOLS)/dependencies/install/include -DARCH_K8 -Wno-deprecated -I$(ORTOOLS)/dependencies/install/include -I$(ORTOOLS)/dependencies/install/include -DUSE_CBC -I$(ORTOOLS)/dependencies/install/include -DUSE_CLP -DUSE_GLOP -DUSE_BOP -I$(ORTOOLS)/dependencies/install/include\n#cgo LDFLAGS: -L/home/bpowers/src/or-tools/lib -lortools -lrt -lpthread\n#define intgo swig_intgo|' ortools.go
