import daft
import ray
# Refer to the note under "Ray Job" for details on "runtime_env"
ray.init("ray://localhost:10001", runtime_env={"pip": ["getdaft"]})
# Starts the Ray client and tells Daft to use Ray to execute queries
# If ray.init() has already been called, it uses the existing client
daft.context.set_runner_ray("ray://localhost:10001")
df = daft.from_pydict({
    "a": [3, 2, 5, 6, 1, 4],
    "b": [True, False, False, True, True, False]
})
df = df.where(df["b"]).sort(df["a"])
# Daft executes the query remotely and returns a preview to the client
df.collect()
df.show()
