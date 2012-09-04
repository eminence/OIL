all: test

cc=cl
link=link
lib_objects=oil-image.obj oil-format.obj oil-format-png.obj oil-palette.obj oil-dither.obj
cflags=/I D:\wdir\lxd\lpng1512 /D "WIN32"
ldflags=/LIBPATH:"D:\wdir\lxd\lpng1512\projects\vstudio\Release" "libpng15.lib"

.c.obj:
	$(cc) /c $(cflags) $*.c

liboil: $(lib_objects)
	lib /OUT:liboil.lib $(lib_objects)

test: liboil main.obj
	$(link) main.obj /OUT:test.exe liboil.lib $(ldflags)
