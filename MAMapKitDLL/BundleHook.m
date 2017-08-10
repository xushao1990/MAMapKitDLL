@import ObjectiveC.runtime;
@import ObjectiveC.message;
@import Foundation.NSBundle;
@import Foundation.NSObject;
@import Foundation.NSObjCRuntime;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

struct CHClassDeclaration_ {
    Class class_;
    Class metaClass_;
    Class superClass_;
};
typedef struct CHClassDeclaration_ CHClassDeclaration_;

static inline Class CHLoadClass_(CHClassDeclaration_ *declaration, Class value)
{
    declaration->class_ = value;
    declaration->metaClass_ = object_getClass(value);
    declaration->superClass_ = class_getSuperclass(value);
    return value;
}
__attribute__((unused)) inline __attribute__((always_inline))
static void *CHIvar_(id object, const char *name)
{
    Ivar ivar = class_getInstanceVariable(object_getClass(object), name);
    if (ivar)
        return (void *)&((char *)(__bridge void *)object)[ivar_getOffset(ivar)];
    return ((void*)0);
}

@class AMapResourceReader; static CHClassDeclaration_ AMapResourceReader$;;

static id (*$AMapResourceReader_bundleWithName$_super)(AMapResourceReader * self, SEL _cmd, id arg1);
static id $AMapResourceReader_bundleWithName$_closure(AMapResourceReader * self, SEL _cmd, id arg1) {
    typedef id (*supType)(AMapResourceReader *, SEL, id arg1);
    supType supFn = (supType)class_getMethodImplementation(AMapResourceReader$.superClass_, _cmd);
    return supFn (self, _cmd, arg1);
}

static id $AMapResourceReader_bundleWithName$_method(AMapResourceReader * self, SEL _cmd, id arg1);

__attribute__((always_inline)) static inline void $AMapResourceReader_bundleWithName$_register() {
    Method method = class_getInstanceMethod(AMapResourceReader$.class_, @selector(bundleWithName:));
    if (method) {
        $AMapResourceReader_bundleWithName$_super = (__typeof__($AMapResourceReader_bundleWithName$_super))method_getImplementation(method);
        if (class_addMethod(AMapResourceReader$.class_, @selector(bundleWithName:), (IMP)&$AMapResourceReader_bundleWithName$_method, method_getTypeEncoding(method))) {
            $AMapResourceReader_bundleWithName$_super = &$AMapResourceReader_bundleWithName$_closure;
        } else {
            method_setImplementation(method, (IMP)&$AMapResourceReader_bundleWithName$_method);
        }
    } else {
        const char *return_ = @encode(id); size_t return_len = __builtin_strlen(return_);
        const char *type1_ = @encode(id); size_t type1_len = __builtin_strlen(type1_);
        char sig[return_len+2+type1_len+1]; __builtin_memcpy(sig, return_, return_len);
        sig[return_len] = '@'; sig[return_len+1] = ':';
        __builtin_memcpy(&sig[return_len+2], type1_, type1_len);
        sig[return_len+type1_len+2] = '\0';
        class_addMethod(AMapResourceReader$.class_, @selector(bundleWithName:), (IMP)&$AMapResourceReader_bundleWithName$_method, sig);
    }
}
static id $AMapResourceReader_bundleWithName$_method(AMapResourceReader * self, SEL _cmd, id arg1)
{
    NSString *path = [[NSBundle bundleForClass:NSClassFromString(@"AMapResourceReader")] pathForResource:arg1 ofType:@"bundle"];
    return [NSBundle bundleWithPath:path];
}

__attribute__((constructor)) static void BundleHook()
{
    CHLoadClass_(&AMapResourceReader$, objc_getClass("AMapResourceReader"));
    $AMapResourceReader_bundleWithName$_register();
}

#pragma clang diagnostic pop
