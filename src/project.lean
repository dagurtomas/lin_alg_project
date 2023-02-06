import data.real.basic
import linear_algebra.finite_dimensional 
import algebra.module.linear_map


-- The structure of an ℝ-vector space on a type. Don't worry about this.
@[ext, class]
structure R_vector_space (V : Type) extends add_comm_group V, module ℝ V

-- The type of ℝ-linear maps between two vector spaces. Don't worry about this.
abbreviation R_linear_map (V W : Type) [R_vector_space V] [R_vector_space W] :=
  linear_map (ring_hom.id ℝ) V W

/-  Some variables you can use: `V` and `W` are vector spaces over ℝ, and `f` is a linear map 
    `V → W`. -/
variables {V W : Type} [R_vector_space V] [R_vector_space W]
variables (f : R_linear_map V W)

/-  Try writing `cases f,` in tactic mode below. The hypothesis `f` will disappear and three new 
    ones will appear in its place: `f_to_fun`, `f_map_add'`, and `f_map_smul'` (smul stands for 
    scalar multiplication). The first is just the underlying function `V → W` while the latter two 
    are the defining properties of a linear map. You can access these any time using dot notation 
    without using the `cases` tactic (e.g. `f.to_fun : V → W`). First try finishing the proof by 
    yourself. Then try `library_search` to see if Lean already knows that a linear map takes 
    0 to 0. -/
example : f 0 = 0 :=
begin
  sorry, -- start with `cases f, simp,` and finish the proof yourself
end  
example : f 0 = 0 :=
begin
  sorry, -- try library_search
end

/-  Recall that the type of subsets of a type `α` is denoted `set α` and is definitionally equal to 
    the type `α → Prop`. Think about why this makes sense. Below, we define the kernel of a linear 
    map from `V` to `W`. This is the subset of `V` that gets mapped to zero, in other words the map 
    `V → Prop` that takes `x` to the proposition `f x = 0`. Our goal is to prove that a linear map
    is injective iff the kernel is trivial -/
def ker : set V := λ x, f x = 0

/-  By proving the following series of lemmas, you should have everything you need to prove the
    theorem.  -/

-- If `f` is injective, then the only element that gets mapped to zero is zero itself
lemma zero_injective (hf : function.injective f) (x : V) : (f x) = 0 → x = 0 :=
begin
  sorry,
end

-- An obvious, but useful lemma
lemma minus_lemma (x y : V) : x = y ↔ x - y = 0 :=
begin
  sorry,
end

-- Another useful lemma
lemma minus_lemma_map (x y : V) : f x = f y ↔ f (x - y) = 0 :=
begin
  sorry,
end

-- The main theorem
theorem injective_iff_ker_eq_zero : function.injective f ↔ ker f = {0} :=
begin
  sorry,
end

/-  Possibly useful tricks: 
    - `map_sub f : f (x - y) = f x - f y`
    - `map_zero f : f 0 = 0`
    - `rw ← add_left_inj a` adds `a` to both sides of an equation -/

/-  Ideas on how to continue this project:
    - Define eigenvalues and prove some theorems about them.
    - Prove that if V and W have the same finite dimension, then f is injective if and only if it is 
      surjective, or other properties of finite dimensional vector spaces. Write 
      `[finite_dimensional ℝ V]` before the colon if you want to assume that `V` is finite 
      dimensional.
    - Prove that every linear map `ℝ → ℝ` is of the form `λ x, a • x` where `a` is a real number
    - Anything else you can think of!  -/

/-  You don't need to worry about the following instance, it's just telling Lean how to regard ℝ as 
    a vector space over itself. -/
instance : R_vector_space ℝ := 
{ to_add_comm_group := by apply_instance,
  to_module := by apply_instance, }

