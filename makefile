CC := g++

SRC_DIR = src
BUILD_DIR = build

build_dir:
	mkdir -p ${BUILD_DIR}

compile:build_dir
	${CC} -c ${SRC_DIR}/main.cpp -o ${BUILD_DIR}/main.o -I include/
	${CC} -c ${SRC_DIR}/glad.cpp -o ${BUILD_DIR}/glad.o -I include/
	${CC} -c ${SRC_DIR}/App.cpp -o ${BUILD_DIR}/App.o -I include/
	${CC} -c ${SRC_DIR}/Triangle.cpp -o ${BUILD_DIR}/Triangle.o -I include/
	${CC} -c ${SRC_DIR}/FileUtil.cpp -o ${BUILD_DIR}/FileUtil.o -I include/

link:compile
	${CC} ${BUILD_DIR}/*.o -o ${BUILD_DIR}/main.exe -Llib -lglfw3dll -lopengl32 
	
run:link
	${BUILD_DIR}/main
	
clean:
	rm ${BUILD_DIR}/*.o 
	rm ${BUILD_DIR}/main.exe