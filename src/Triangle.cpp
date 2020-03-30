#include "Triangle.h"
#include "FileUtil.h"

void Triangle::init() {
	std::string vsShader = readTextContent("shader/triangle_vertex.glsl");
	std::string fragShader = readTextContent("shader/triangle_fragment.glsl");
	
	programId = CreateGPUProgram(vsShader.c_str() , fragShader.c_str());
	
	glGenVertexArrays(1, &vao);
	glGenBuffers(1, &vbo);
	glBindVertexArray(vao);

	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);

	glBindBuffer(GL_ARRAY_BUFFER, 0);
	
	glBindVertexArray(0);
}

void Triangle::update(int w, int h) {
	glUseProgram(programId);
	glBindVertexArray(vao);
	glDrawArrays(GL_TRIANGLES, 0, 3);
}

void Triangle::onDestory() {
	glDeleteVertexArrays(1, &vao);
	glDeleteBuffers(1, &vbo);
}

Triangle::~Triangle(){
	onDestory();
	std::cout << "Triangle deconstruct" << std::endl;
}