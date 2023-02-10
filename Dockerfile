# Docker images can be inherited from other images. Therefore, instead of creating our own base image, 
# we’ll use the official Node.js image that already has all the tools and packages that we need to run a Node.js application. 
# You can think of this in the same way 
# you would think about class inheritance in object oriented programming.


FROM node:12.18.1

# The NODE_ENV environment variable specifies the environment in 
# which an application is running 
# (usually, development or production). 
# One of the simplest things you can do to improve performance is to set

ENV NODE_ENV=production

# To make things easier when running the rest of our commands, let’s create a working directory

WORKDIR /app


# Before we can run npm install, we need to get our package.json and package-lock.json files into our images.
#  We use the COPY command to do this. The COPY command takes two parameters: src and dest.
#  The first parameter src tells Docker what file(s) you would like to copy into the image. 
#  The second parameter dest tells Docker where you want that file(s) to be copied to

COPY ["package.json", "package-lock.json*", "./"]


# . Once we have our files inside the image, we can use the RUN command to execute the command npm install. 
# This works exactly the same as if we were running npm install locally on our machine,
#  but this time these Node modules will be installed into the node_modules directory inside our image.

RUN npm install --production

# The next thing we need to do is to add our source code into the image. 
# We’ll use the COPY command just like we did with our package.json

COPY . .

# The COPY command takes all the files located in the current directory and copies them into the image. Now, 
# all we have to do is to tell Docker what command we want to run when our image is run inside of a container. 
# We do this with the CMD command

CMD [ "node", "server.js" ]
