#!/bin/bash

if [ -z "$1" ]; then
    exit 1;
fi

visible_workspaces=$(
    i3-msg -t get_workspaces \
        | jq '[ .[] | (if .visible == true then .name + "," + .output else null end) ] | (reduce .[] as $visible (""; . + (if $visible then " " + $visible else null end) )) | ltrimstr(" ")'
);
active_workspace_output=$(
    i3-msg -t get_workspaces \
        | jq '[ .[] | (if .focused == true then .name else null end) ] | (reduce .[] as $active (""; . + $active) )'
);
active_workspace=${active_workspace_output//\"};
new_workspace=$1;

IFS=" " read -r -a visible_workspaces_array <<< "${visible_workspaces//\"}"

if [ "$active_workspace" == "$new_workspace" ]; then
    exit 0;
fi

for workspace in "${!visible_workspaces_array[@]}"; do
    IFS="," read -r workspace_num workspace_output <<< ${visible_workspaces_array[$workspace]};
    echo $workspace $workspace_num $workspace_output;
    i3-msg "workspace \"temp$workspace\" output \"$workspace_output\"";
done

exit 0;

# move focus from current workspace so i3 won't throw an error
i3-msg "workspace temp1";

# swap workspaces by renaming them
i3-msg "rename workspace $active_workspace to temp2";
i3-msg "rename workspace $new_workspace to $active_workspace";
i3-msg "rename workspace $temp2 to $new_workspace";

# refocus current workspace
i3-msg "workspace $active_workspace";

# i3-msg "rename workspace $active_workspace to temporary; rename workspace $new_workspace to $active_workspace; rename workspace temporary to $new_workspace"
for workspace in "${!visible_workspaces_array[@]}"; do
    IFS="," read -r workspace_num workspace_output <<< ${visible_workspaces_array[$workspace]};
    echo $workspace $workspace_num $workspace_output;
    i3-msg "workspace $workspace_num";
done
