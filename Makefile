
ORTOOLS = /home/bpowers/src/or-tools
#SWIG = $(ORTOOLS)/dependencies/install/bin/swig
SWIG = swig

# 		-I$(ORTOOLS)/dependencies/install/include \


all: FORCE
	$(SWIG) \
		-I/usr/include/ortools \
		-DUSE_CLP -DUSE_CBC -DUSE_GLOP -DUSE_BOP \
		-I$(ORTOOLS) \
		-c++ -go -cgo -intgosize 64 \
		-o linear_solver_go_wrap.cc -module ortools \
		wrapper/linear_solver.swig
	perl -pi -e 's|#define intgo swig_intgo|#cgo CXXFLAGS: -std=c++0x -fwrapv -O4 -DNDEBUG -I/usr/include/ortools -DARCH_K8 -Wno-deprecated -DUSE_CBC -DUSE_CLP -DUSE_GLOP -DUSE_BOP\n#cgo LDFLAGS: -L/usr/lib -lortools -lrt -lpthread\n#define intgo swig_intgo|' ortools.go

.PHONY: all FORCE
