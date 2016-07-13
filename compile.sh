rm dmtl.jar

javac -classpath ../hadoop-core-0.20.203.0.jar:../lib/commons-cli-1.2.jar:../lib/commons-logging-1.1.1.jar:commons-codec-1.2.jar MRStats.java MR_CannonicalCode.java MR_Pattern.java Util_functions.java MR_Serialize.java MyInputFormat.java mapperReader.java graphMining.java

jar -cvf dmtl.jar *.class

rm *.class
