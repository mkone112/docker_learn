# err - конкатенация так не работает
RUN ["/bin/bash", "-c", "echo ${RED}HI$" "{COLOR_END}"]
