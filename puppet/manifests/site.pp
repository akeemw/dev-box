/* Install Drupal 7 from GIT */

projects::create { 'd7':
  git_url => 'http://git.drupal.org/project/drupal.git',
  git_branch => '7.x',
  conf => {
    'securepages_enable' => 0,
  },
}
