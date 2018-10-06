static int my_thumb(int dummy)

{

    __asm__("movw
 r0, #1001 \t\n"

            "movw
 r12, #2020 \t\n"

            "add
 r0, r0, r12 \t\n"

            "bx 
 lr");

     

    return dummy;

}

 

 

jstring

Java_com_example_hellojni_HelloJni_stringFromJNI(
 JNIEnv* env,

                                                  jobject
 thiz )

{

    my_thumb(0);

    return (*env)->NewStringUTF(env,
"Hello
 from JNI !");

}

