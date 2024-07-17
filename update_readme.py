
### Python Script to Update README
import os

def update_readme(readme_path='README.md', solutions_dir='Leetcode'):
    # Get list of solution files
    solution_files = [f for f in os.listdir(solutions_dir) if f.endswith('.swift')]
    
    # Sort files by problem number
    solution_files.sort(key=lambda x: int(x.split('_')[0]))

    # Generate Table of Contents
    toc = []
    for file in solution_files:
        problem_number, problem_title = file.split('_', 1)
        problem_title = problem_title.replace('.swift', '').replace('_', ' ')
        toc.append(f'- [{problem_number}. {problem_title}](Leetcode/{file})')
    
    toc_str = '\n'.join(toc)

    # Read the current README file
    with open(readme_path, 'r') as file:
        readme_contents = file.read()

    # Update the Table of Contents section
    new_readme_contents = readme_contents.split('<!-- TOC start -->')[0] + '<!-- TOC start -->\n' + toc_str + '\n<!-- TOC end -->' + readme_contents.split('<!-- TOC end -->')[1]

    # Write the updated README file
    with open(readme_path, 'w') as file:
        file.write(new_readme_contents)

if __name__ == '__main__':
    update_readme()
