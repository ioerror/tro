JAVAC=/usr/lib/jvm/java-6-openjdk/bin/javac
JAVA=/usr/lib/jvm/java-6-openjdk/bin/java
JAR=/usr/lib/jvm/java-6-openjdk/bin/jar
JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
CLASSPATH=/usr/lib/jvm/java-6-openjdk/lib/

build-example: build-OrShim-Jar
	$(JAVAC) -classpath src/ src/org/torproject/torshim/OrShimExample.java

build-OrShim-Jar: build-library
	$(JAR) cvfm OrShim.jar manifest.txt -C src/ org/torproject/torshim/OrShim.class

build-library:
	$(JAVAC) src/org/torproject/torshim/OrShim.java

run-example: build-example
#	$(JAVA) -classpath src/ org.torproject.torshim.OrShimExample
	cd src && $(JAVA) -jar ../OrShim.jar src/org/torproject/torshim/OrShimExample

clean:
	rm OrShim.jar
	rm src/org/torproject/torshim/*.class
