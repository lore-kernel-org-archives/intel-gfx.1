Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B5CC04FFE
	for <intel-gfx@archiver.kernel.org>; Tue, 14 May 2024 14:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDE310EA9E;
	Tue, 14 May 2024 14:50:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9D610EA9A;
 Tue, 14 May 2024 14:50:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/i915=3A_Shadow_default_engine_context_image_in_the?=
 =?utf-8?q?_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 14 May 2024 14:50:57 -0000
Message-ID: <171569825758.2115148.187824379415471148@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513210101.75304-1-tursulin@igalia.com>
In-Reply-To: <20240513210101.75304-1-tursulin@igalia.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,1/2] drm/i915: Shadow default engine context image in the context
URL   : https://patchwork.freedesktop.org/series/133609/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_context.o
drivers/gpu/drm/i915/gem/i915_gem_context.c: In function ‘set_proto_ctx_param’:
drivers/gpu/drm/i915/gem/i915_gem_context.c:961:2: error: duplicate case value
  961 |  case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
      |  ^~~~
drivers/gpu/drm/i915/gem/i915_gem_context.c:909:2: note: previously used here
  909 |  case I915_CONTEXT_PARAM_LOW_LATENCY:
      |  ^~~~
make[6]: *** [scripts/Makefile.build:244: drivers/gpu/drm/i915/gem/i915_gem_context.o] Error 1
make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:1919: .] Error 2
make: *** [Makefile:240: __sub-make] Error 2
Build failed, no error log produced


