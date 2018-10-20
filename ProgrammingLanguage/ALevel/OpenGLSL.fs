//#include "stdafx.h"

 

//包含GLSL所需的头文件

 

#include <iostream>

#include <gl/glut.h>

#include <gl/glext.h>

 

 

 

 

 

static GLuint vertShader;   //顶点着色器对象

static GLuint fragShader;   //片元着色器对象

static GLuint glslProgram;   //程序对象

 

PFNGLATTACHSHADERPROC glAttachShader;

PFNGLSHADERSOURCEPROC glShaderSource;

PFNGLCOMPILESHADERPROC glCompileShader;

PFNGLCREATEPROGRAMPROC glCreateProgram;

PFNGLCREATESHADERPROC glCreateShader;

PFNGLLINKPROGRAMPROC glLinkProgram;

PFNGLUSEPROGRAMPROC glUseProgram;

PFNGLGETSHADERIVPROC glGetShaderiv;

PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog;

PFNGLGETPROGRAMIVPROC glGetProgramiv;

PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog;

 

//读入着色器代码

int readShaderSource(GLuint shader, const char *file)

{

FILE *fp;

const GLchar *source;

GLsizei length;

int ret;

 

glShaderSource = (PFNGLSHADERSOURCEPROC)wglGetProcAddress("glShaderSource");

 

fp = fopen(file, "rb");

if (fp == NULL) {

perror(file);

return -1;

}

 

fseek(fp, 0L, SEEK_END);

length = ftell(fp);

 

source = (GLchar *)malloc(length);

if (source == NULL) {

fprintf(stderr, "Could not allocate read buffer./n");

return -1;

}

 

fseek(fp, 0L, SEEK_SET);

ret = fread((void *)source, 1, length, fp) != (size_t)length;

fclose(fp);

 

if (ret)

fprintf(stderr, "Could not read file: %s./n", file);

else

glShaderSource(shader, 1, &source, &length);

 

free((void *)source);

 

return ret;

}

 

//输出着色器LOG

void printShaderInfoLog(GLuint shader)

{

GLsizei bufSize;

GLchar *infoLog;

GLsizei length;

 

glGetShaderInfoLog = (PFNGLGETSHADERINFOLOGPROC)wglGetProcAddress("glGetShaderInfoLog");

 

glGetShaderiv(shader, GL_INFO_LOG_LENGTH , &bufSize);

if (bufSize > 0) {

infoLog = (GLchar *)malloc(bufSize);

if (infoLog != NULL) {

glGetShaderInfoLog(shader, bufSize, &length, infoLog);

printf("%s/n", infoLog);

free(infoLog);

}

else

printf("Could not allocate InfoLog buffer./n");

}

}

 

//输出程序LOG

void printProgramInfoLog(GLuint program)

{

GLsizei bufSize;

GLchar *infoLog;

GLsizei length;

 

glGetProgramInfoLog = (PFNGLGETPROGRAMINFOLOGPROC)wglGetProcAddress("glGetProgramInfoLog");

 

glGetProgramiv(program, GL_INFO_LOG_LENGTH , &bufSize);

if (bufSize > 0) {  

infoLog = (GLchar *)malloc(bufSize);

if (infoLog != NULL) {   

glGetProgramInfoLog(program, bufSize, &length, infoLog);

printf("%s/n", infoLog);

free(infoLog);

}

else

printf("Could not allocate InfoLog buffer./n");

}

}

 

//初始化

 

void init(void)

{

glClearColor(0.0,0.0,0.0,0.0);

 

glAttachShader = (PFNGLATTACHSHADERPROC)wglGetProcAddress("glAttachShader");

glCompileShader = (PFNGLCOMPILESHADERPROC)wglGetProcAddress("glCompileShader");

glCreateProgram = (PFNGLCREATEPROGRAMPROC)wglGetProcAddress("glCreateProgram");

glCreateShader = (PFNGLCREATESHADERPROC)wglGetProcAddress("glCreateShader");

glLinkProgram = (PFNGLLINKPROGRAMPROC)wglGetProcAddress("glLinkProgram");

glUseProgram = (PFNGLUSEPROGRAMPROC)wglGetProcAddress("glUseProgram");

glGetShaderiv = (PFNGLGETPROGRAMIVPROC)wglGetProcAddress("glGetShaderiv");

glGetProgramiv = (PFNGLGETPROGRAMIVPROC)wglGetProcAddress("glGetProgramiv");

 

GLint compiled, linked;

 

//创建顶点着色器对象和片元着色器对象

vertShader = glCreateShader(GL_VERTEX_SHADER);

fragShader = glCreateShader(GL_FRAGMENT_SHADER);

 

//读入着色器代码

readShaderSource(vertShader, "first.vert");

readShaderSource(fragShader, "first.frag");

 

//编译顶点着色器

glCompileShader(vertShader);

glGetShaderiv(vertShader, GL_COMPILE_STATUS, &compiled);

printShaderInfoLog(vertShader);

if (compiled == GL_FALSE) {

printf("Compile error in vertex shader./n");

exit(1);

}

 

//编译片元着色器

glCompileShader(fragShader);

glGetShaderiv(fragShader, GL_COMPILE_STATUS, &compiled);

printShaderInfoLog(fragShader);

if (compiled == GL_FALSE) {

printf("Compile error in vertex shader./n");

exit(1);

}

 

//创建一个程序对象

glslProgram = glCreateProgram();

 

//将编译好的着色器捆绑到程序对象上

glAttachShader(glslProgram, vertShader);

glAttachShader(glslProgram, fragShader);

 

//连接程序对象

glLinkProgram(glslProgram);

glGetProgramiv(glslProgram, GL_LINK_STATUS, &linked);

printProgramInfoLog(glslProgram);

if (linked == GL_FALSE) {

printf("Link error./n");

exit(1);

}

 

//使用着色器

glUseProgram(glslProgram);

}

 

//物体描画

 

void display(void)

{

glClear(GL_COLOR_BUFFER_BIT);

glRectf(-25.0, -25.0, 25.0, 25.0);

glFlush();

}

 

void reshape(int w, int h)

{

glViewport(0, 0, (GLsizei) w, (GLsizei) h);

glMatrixMode(GL_PROJECTION);

glLoadIdentity();

glOrtho(-50.0, 50.0, -50.0, 50.0, -1.0, 1.0);

glMatrixMode(GL_MODELVIEW);

glLoadIdentity();

}

 

//主函数

 

int main(int argc, char** argv)

{

glutInit(&argc, argv);

glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);

glutInitWindowSize(250,250);

glutInitWindowPosition(100,100);

glutCreateWindow("GLSL");

init();

glutDisplayFunc(display);

glutReshapeFunc(reshape);

glutMainLoop();

return 0;

}
