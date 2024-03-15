#!/bin/bash

declare -A linked_array

function add_to_bag() {
    linked_array[$RANDOM]=$1
}


function remove_from_queue() {
    local key=${!linked_array[@]}
    if [ -n "$key" ]; then
        local position=${linked_array[$key]}
        unset "linked_array[$key]"
        echo "$position"
    fi
}

function add_to_queue() {
    linked_array[$RANDOM]=$1
}

function pop_from_stack() {
    local keys=("${!linked_array[@]}")
    local last_index=$(( ${#keys[@]} - 1 ))
    if [ $last_index -ge 0 ]; then
        local key=${keys[$last_index]}
        local position=${linked_array[$key]}
        unset "linked_array[$key]"
        echo "$position"
    fi
}

function push_to_stack() {
    linked_array[$RANDOM]=$1
}

add_to_bag "position1"
add_to_bag "position2"
add_to_bag "position3"

echo "Bag: ${linked_array[@]}"

item_from_queue=$(remove_from_queue)
echo "position removed from queue: $position_from_queue"

add_to_queue "new position"

echo "queue: ${linked_array[@]}"

position_from_stack=$(pop_from_stack)
echo "position popped from stack: $position_from_stack"

push_to_stack "another position"

echo "stack: ${linked_array[@]}"
