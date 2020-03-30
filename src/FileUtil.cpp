#include "FileUtil.h"
#include <iostream>
#include <fstream>

std::string readTextContent(std::string filePath) {
    std::string content;

    std::ifstream infile(filePath);
	if(infile.is_open()){
		std::string line;
		while(std::getline(infile , line)){
            line += "\n";
			content += line;
		}//end while
	}else{
        std::cout << "open file : " << filePath << " error "<<std::endl;
    }
	infile.close();
    
    return content;
}

// int main() {
//     std::string fileContent = readTextContent("shader/triangle_vertex.glsl");
//     std::cout << fileContent << std::endl;
//     printf("%s \n" , fileContent.c_str());
//     return 0;
// }