JAVAC=/usr/lib/jvm/java-6-openjdk/bin/javac
JAR=/usr/lib/jvm/java-6-openjdk/bin/jar

build-example: build-OrShim-Jar
	$(JAVAC) -classpath src/ src/org/torproject/torshim/OrShimExample.java

build-OrShim-Jar: build-library
	$(JAR) cvfm OrShim.jar manifest.txt src/org/torproject/torshim/OrShim.class

build-library:
	$(JAVAC) src/org/torproject/torshim/OrShim.java

run-example: build-example
	java -classpath src/org/torproject/torshim/ -classpath OrShim.jar OrShimExample

clean:
	rm OrShim.jar
	rm src/org/torproject/torshim/*.class
