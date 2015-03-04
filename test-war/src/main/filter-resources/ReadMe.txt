此文件夹用于配置各环境的动态配置文件，在编译时替换文件
替换方式：
   先将public 下的xml, properties复制到 WEB-INF/classes下
   然后会将编译对应环境（即 -Psit 这样的参数）下的xml, properties 复制到 WEB-INF/classes下
  包验证可以看classes下面有个对应环境的properties命名


如果需要增加不同结构的文件copy请修改下面的配置

maven配置在主pom.xml
               <plugin>
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-war-plugin</artifactId>
					<version>2.2</version>
					<configuration>
	                	<encoding>${project.build.sourceEncoding}</encoding>
	                    <archive>
	                        <addMavenDescriptor>false</addMavenDescriptor>
	                    </archive>
	                    <webResources>
	                        <resource>
	                            <directory>src/main/filter-resources/public/</directory>
	                            <targetPath>WEB-INF/classes</targetPath>
	                            <filtering>true</filtering>
	                            <includes>
	                            	<include>*.xml</include>
	                            	<include>*.properties</include>
	                            </includes>
	                        </resource>
	                        <resource>
	                            <directory>src/main/filter-resources/${package.env}</directory>
	                            <targetPath>WEB-INF/classes</targetPath>
	                            <filtering>true</filtering>
	                            <includes>
	                            	<include>*.xml</include>
	                            	<include>*.properties</include>
	                            </includes>
	                        </resource>
	                    </webResources>
	                </configuration>
				</plugin>
				