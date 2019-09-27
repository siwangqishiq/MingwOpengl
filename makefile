compile:
	g++ -c src/main.cpp -o main.o
	g++ -c src/glad.cpp -o glad.o
	g++ -c src/App.cpp -o App.o
	g++ -c src/Triangle.cpp -o Triangle.o

link:compile
	g++ *.o -o main.exe -lglfw3dll -lopengl32
	
run:link
	main
	
clean:
	rm *.o main.exe