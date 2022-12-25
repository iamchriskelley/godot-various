shader_type canvas_item;

void fragment(){
	vec4 bg = texture(SCREEN_TEXTURE, SCREEN_UV);
	float gray = 0.3 * bg.r + 0.59 * bg.g + 0.11 * bg.b;
	float alpha = 1.0;
	COLOR = vec4(gray, gray, gray, alpha);
}