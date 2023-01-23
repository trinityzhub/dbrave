#!/bin/bash

######### METHOD :  USING IMAGETAG : #3 <DELETE<OPS<DOCKER

## ./delete-docker.sh
## ./terminal/DOCKER/KNOW_DOCKER/delete/delete-docker.sh
## https://github.com/joelz-jobs/workbook/blob/main/terminal/DOCKER/KNOW_DOCKER/delete/delete-docker.sh
## wget https://raw.githubusercontent.com/joelz-jobs/workbook/main/terminal/DOCKER/KNOW_DOCKER/delete/delete-docker.sh

echo "PLEASE SELECT IMAGE:"
choices=($(docker images --format "{{.Repository}}:{{.Tag}}"))


##choices=( 'one' 'two' 'three' 'four' 'five' ) # sample choices
select dummy in "${choices[@]}"; do  # present numbered choices to user
  # Parse ,-separated numbers entered into an array.
  # Variable $REPLY contains whatever the user entered.
  IFS=', ' read -ra selChoices <<<"$REPLY"
  # Loop over all numbers entered.
  for choice in "${selChoices[@]}"; do
    # Validate the number entered.
    (( choice >= 1 && choice <= ${#choices[@]} )) || { echo "Invalid choice: $choice. Try again." >&2; continue 2; }
    # If valid, echo the choice and its number.
    echo "Choice #$(( ++choiceIncrementor )): ${choices[choice-1]} ($choice)"
    mydockerdelchoice=${choices[choice-1]}

  done
  # All choices are valid, exit the prompt.
  break
done

unset choices
unset selChoices
unset choiceIncrementor
unset dummy


docker container ls --all | grep $mydockerdelchoice | awk '{print $1}' | xargs docker rm 
docker rmi $mydockerdelchoice 

## METHOD : USING IMAGE ID
#docker container ls --all | grep <IMAGE_ID> | awk '{print $1}' | xargs docker rm 
#docker container ls --all | grep 390985b45759 | awk '{print $1}' | xargs docker rm 
