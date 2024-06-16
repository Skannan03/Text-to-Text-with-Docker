##use the official python 3.9
FROM python:3.9
##set the working dir to /code
WORKDIR /code

##copy the current dir tocontents in the container at /code
COPY ./requirements.txt /code/requirements.txt
##install req.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


#set up a new user
RUN useradd user

#Uswitch user to user
USER user
#set home to user home dir

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

#set the working dir to the user home dir
WORKDIR $HOME/app

#copy the cur dir con into the container at HOME/appsetting to the owner to the user
COPY --chown=user . $HOME/app

#start the fast api app on port 7860
CMD ["uvicorn","app:app","--host","0.0.0.0","--port","7860"]
