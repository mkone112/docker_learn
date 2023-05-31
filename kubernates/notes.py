проброс env

a=1; kubectl -n $ns exec -it $pod -- screen -S $ticket_no -d -RR bash -c "export a=$a && bash"