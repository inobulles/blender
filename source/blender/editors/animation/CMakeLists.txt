# SPDX-License-Identifier: GPL-2.0-or-later

set(INC
  ../include
  ../../blenkernel
  ../../blenlib
  ../../blentranslation
  ../../depsgraph
  ../../gpu
  ../../makesdna
  ../../makesrna
  ../../sequencer
  ../../windowmanager
  ../../../../intern/clog
  ../../../../intern/glew-mx
  ../../../../intern/guardedalloc
)


set(SRC
  anim_channels_defines.c
  anim_channels_edit.c
  anim_deps.c
  anim_draw.c
  anim_filter.c
  anim_ipo_utils.c
  anim_markers.c
  anim_motion_paths.c
  anim_ops.c
  drivers.c
  fmodifier_ui.c
  keyframes_draw.c
  keyframes_edit.c
  keyframes_general.c
  keyframes_keylist.cc
  keyframing.c
  keyingsets.c
  time_scrub_ui.c

  anim_intern.h
)

set(LIB
  bf_blenkernel
  bf_blenlib
)

if(WITH_PYTHON)
  add_definitions(-DWITH_PYTHON)
endif()


blender_add_lib(bf_editor_animation "${SRC}" "${INC}" "${INC_SYS}" "${LIB}")

if(WITH_GTESTS)
  set(TEST_SRC
    keyframes_keylist_test.cc
  )
  set(TEST_INC
  )
  set(TEST_LIB
  )
  include(GTestTesting)
  blender_add_test_lib(bf_editor_animation_tests "${TEST_SRC}" "${INC};${TEST_INC}" "${INC_SYS}" "${LIB};${TEST_LIB}")
endif()
