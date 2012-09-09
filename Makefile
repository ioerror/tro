JAVAC=/usr/lib/jvm/java-6-openjdk/bin/javac
JAVA=/usr/lib/jvm/java-6-openjdk/bin/java
JAR=/usr/lib/jvm/java-6-openjdk/bin/jar
JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
CLASSPATH=/usr/lib/jvm/java-6-openjdk/lib/

build-OrShimExample-Jar: build-example
	$(JAR) cvfm OrShimExample.jar orshim-example-manifest.txt -C src/ org/torproject/torshim/OrShimExample.class

build-example: build-OrShim-Jar
	$(JAVAC) -classpath src/ src/org/torproject/torshim/OrShimExample.java

build-OrShim-Jar: build-library
	$(JAR) cvfm OrShim.jar orshim-manifest.txt -C src/ org/torproject/torshim/OrShim.class

build-library:
	$(JAVAC) src/org/torproject/torshim/OrShim.java

run-example: build-example
#	$(JAVA) -classpath src/ org.torproject.torshim.OrShimExample
#	cd src && $(JAVA) -Xbootclasspath/p:../OrShim.jar src/org/torproject/torshim/OrShimExample org.torproject.torshim.OrShimExample
	$(JAVA) -Xbootclasspath/p:OrShim.jar -jar OrShimExample.jar

clean:
	rm OrShim.jar
	rm OrShimExample.jar
	rm src/org/torproject/torshim/*.class
