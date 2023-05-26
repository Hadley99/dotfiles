# ~/work

for file in ~/work/*; do
    full_name=$(basename $file)
    shorted_name=${full_name#repair-serve-}

    hash -d $(basename $shorted_name)="$(eval echo $file)"
done

# hash -d web='/home/hadley/work/repair-serve-web'
# hash -d admin='/home/hadley/work/repair-serve-admin'
# hash -d functions='/home/hadley/work/repair-serve-functions'
# hash -d callables='/home/hadley/work/repair-serve-callable'
# hash -d import-manager='/home/hadley/work/import-manager'

# ~/personal
