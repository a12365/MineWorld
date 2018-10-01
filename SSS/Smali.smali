
p0  this
p1  I
p2,p3  J
p4  Z 

# static fields             定义静态变量的标记
# instance fields        定义实例变量的标记
# direct methods       定义静态方法的标记
# virtual methods      定义非静态方法的标记


    :cond_8
    invoke-direct {p0}, Lcom/paul/test/a;->d()V

    :cond_b
    const/4 v0, 0x0
    invoke-virtual {p0, v0}, Lcom/paul/test/a;->setPressed(Z)V
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyUp(ILandroid/view/KeyEvent;)Z
    move-result v0