# Structurizr DSL

The Structurizr DSL (Diagrams as code) allows you to create multiple diagrams based upon the C4 model, in multiple output formats, from a single DSL source file. There are a number of options for authoring workspaces with the Structurizr DSL.

## Structurizr Lite

Structurizr Lite provides a way to quickly work with a single workspace. It's free to use, and allows you to view/edit diagrams, view documentation, and view architecture decision records defined in a DSL workspace.

The auto-sync feature provides the ability to sync your local changes with a workspace stored on the Structurizr cloud service or an on-premises installation.

- [Structurizr Lite Github](https://github.com/structurizr/lite)
- [Documentation](https://structurizr.com/share/76352/documentation)

For the examples, the **container** version is going to be used.

```bash
# Current folder
docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr structurizr/lite

# Specific folder
mkdir volume
docker run -it --rm -p 8080:8080 -v $PWD/volume:/usr/local/structurizr structurizr/lite

# Using workspaces path (extends ../model.dsl)
docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr \
    -e STRUCTURIZR_WORKSPACE_PATH=internet-banking-system \
    structurizr/lite

# Modify the 'structurizr/volume/workspace.dsl' file to update the UI

# Go to http://localhost:8080/
# - http://localhost:8080/workspace/diagrams
# - http://localhost:8080/workspace/documentation

# Use CLI to export diagrams to PlantUML, Mermaid, WebSequenceDiagrams, DOT, and Ilograph; or a DSL workspace to JSON
```

## Examples

```bash
# Example 01 - Minimal Example using MarkDown
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-01:/usr/local/structurizr structurizr/lite

# Example 02 - More Complex Example using MarkDown, Styles (Shapes, Colors, etc..) and Several Views (Context -> Container -> Component)
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-02:/usr/local/structurizr structurizr/lite

# Example 03 - Another Example using MarkDown, Decisions (adrs), Styles (Shapes, Colors, etc..) and 
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-03:/usr/local/structurizr structurizr/lite

# Example 04 - Another Example using External Styles (Shapes, Colors, etc..) and Groups
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-04:/usr/local/structurizr structurizr/lite

# Example 04 - Another Example using External Styles (Shapes, Colors, etc..) and Groups
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-04:/usr/local/structurizr structurizr/lite

# Example 05 - Another Example using Workspace paths and workspace extension (useful to split model from views for larger systems)
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-05:/usr/local/structurizr \
-e STRUCTURIZR_WORKSPACE_PATH=internet-banking-system structurizr/lite

docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-05:/usr/local/structurizr \
-e STRUCTURIZR_WORKSPACE_PATH=system-landscape structurizr/lite

# Example 06 - Another Example using Includes to split models and views.
docker run -it --rm -p 8080:8080 -v $PWD/structurizr/examples/example-06:/usr/local/structurizr structurizr/lite

```