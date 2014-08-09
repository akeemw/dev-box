# Get the structured data:
$projects = hiera('projects')

create_resources(projects::create, $projects)
