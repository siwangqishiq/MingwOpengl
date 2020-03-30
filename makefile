compile:
	g++ -c src/main.cpp -o main.o -I include/
	g++ -c src/glad.cpp -o glad.o -I include/
	g++ -c src/App.cpp -o App.o -I include/
	g++ -c src/Triangle.cpp -o Triangle.o -I include/
	g++ -c src/FileUtil.cpp -o FileUtil.o -I include/

link:compile
	g++ *.o -o main.exe -Llib -lglfw3dll -lopengl32 
	
run:link
	./main
	
clean:
	rm *.o main.exe