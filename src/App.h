#pragma once

#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <iostream>
#include "glm/common.hpp"

// settings
const unsigned int SCR_WIDTH = 1280;
const unsigned int SCR_HEIGHT = 800;

struct Vertex {
	float x, y;
	float r, g, b;
};

class IApp {
public:
	virtual void init() = 0;
	virtual void update(int w , int h) = 0;
	virtual void onDestory() = 0;
	virtual ~IApp() {
	}
};

GLuint CompileShader(GLenum shaderType, const char* shaderSource);

GLuint CreateGPUProgram(const char* vsShaderSource, const char* fsShaderSource);
