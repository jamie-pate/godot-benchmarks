extends Benchmark

const LOREM_IPSUM = "Ullam dolorum consequuntur minima neque soluta ab. Est dolores officiis reiciendis omnis eum inventore. Laboriosam quis magni asperiores officia fuga animi qui. Quisquam repudiandae non quisquam vero aut id. Voluptatem occaecati fugiat officia distinctio omnis nesciunt occaecati."
const FONT_SIZE = 9

func _init() -> void:
	test_render_cpu = true
	test_render_gpu = true


func benchmark_label3D() -> Label3D:
	var label = Label3D.new()
	label.font_size = FONT_SIZE
	label.text = LOREM_IPSUM.repeat(100)
	var camera := Camera3D.new()
	camera.transform.origin = Vector3.FORWARD * -1
	camera.current = true
	label.add_child(camera)
	return label


func benchmark_label3D_autowrap_arbitrary() -> Label3D:
	var label := benchmark_label3D()
	label.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
	return label


func benchmark_label3D_autowrap_word() -> Label3D:
	var label := benchmark_label3D()
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	return label


func benchmark_label3D_autowrap_smart() -> Label3D:
	var label = benchmark_label3D()
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	return label
