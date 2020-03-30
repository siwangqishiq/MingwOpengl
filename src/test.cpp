#include <iostream>
#include <glm/glm.hpp>
#include <glm/ext.hpp> 

glm::mat4 transform(glm::vec2 const& Orientation, glm::vec3 const& Translate, glm::vec3 const& Up) {
    glm::mat4 Proj = glm::perspective(glm::radians(45.f), 1.33f, 0.1f, 10.f);
    glm::mat4 ViewTranslate = glm::translate(glm::mat4(1.f), Translate);
    glm::mat4 ViewRotateX = glm::rotate(ViewTranslate, Orientation.y, Up);
    glm::mat4 View = glm::rotate(ViewRotateX, Orientation.x, Up);
    glm::mat4 Model = glm::mat4(1.0f);
    return Proj * View * Model;
}

void test_glm() {
    transform(glm::vec2(0, 0 ) , {1.0f,1.0f,1.0f} , {0.0f , 0.0f , 1.0f});
}


int main(int argc , char *argv[]) {
    std::cout << "hello test" <<std::endl;
    test_glm();

    return 0;
}