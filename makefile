CC := g++

SRC_DIR = src
BUILD_DIR = .

build_dir:
	mkdir -p ${BUILD_DIR}

compile:main.o glad.o App.o Triangle.o FileUtil.o
	
${BUILD_DIR}/Triangle.o:${SRC_DIR}/Triangle.cpp
	${CC} -c ${SRC_DIR}/Triangle.cpp -o ${BUILD_DIR}/Triangle.o -I include/
	
${BUILD_DIR}/FileUtil.o:${SRC_DIR}/FileUtil.cpp
	${CC} -c ${SRC_DIR}/FileUtil.cpp -o ${BUILD_DIR}/FileUtil.o -I include/

${BUILD_DIR}/App.o:${SRC_DIR}/App.cpp
	${CC} -c ${SRC_DIR}/App.cpp -o ${BUILD_DIR}/App.o -I include/
	
${BUILD_DIR}/glad.o:${SRC_DIR}/glad.cpp
	${CC} -c ${SRC_DIR}/glad.cpp -o ${BUILD_DIR}/glad.o -I include/

${BUILD_DIR}/main.o:${SRC_DIR}/main.cpp
	${CC} -c ${SRC_DIR}/main.cpp -o ${BUILD_DIR}/main.o -I include/

link:compile
	${CC} ${BUILD_DIR}/*.o -o ${BUILD_DIR}/main.exe -Llib -lglfw3dll -lopengl32 
	
run:link
	${BUILD_DIR}/main

test_compile:
	${CC} ${SRC_DIR}/test.cpp -o ${BUILD_DIR}/test -I include/
	
test:test_compile
	${BUILD_DIR}/test
	
clean:
	rm -f ${BUILD_DIR}/*.o 
	rm -f ${BUILD_DIR}/main.exe
	rm -f ${BUILD_DIR}/test.exe