Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9147C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A2D61073
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7A2D61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AB26E22B;
	Wed, 25 Aug 2021 14:24:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C32A6E0E5;
 Tue, 24 Aug 2021 22:54:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2BF861139;
 Tue, 24 Aug 2021 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629845681;
 bh=VRPyW1VeO7gfAN1WVH2HUQN9HNXvpNgT4uXN0dtpgSg=;
 h=From:To:Cc:Subject:Date:From;
 b=flB5TcWMNT76AKxh3XR22CrIVe8y0lorcQ+fmCHwlvsCWMEVcQfSoaPUhs+8NCd3s
 w3n5+bOLR393xOnucjv1GYNkNNyLzyt0Tvn3ywytxpMLxGssKqF51mFz+pQwl6khSn
 J/2ZWz5pS1Ny9jpFU/IS94ve1YYaJ3MW2ggL++ktqzgAl6F2s7Xkk1DFDm3ssrOcZ7
 GAYAHHwG3Spard0hg/zFb3yOZuIJ3fhxZDHdulADHM7JXE5PsDXhxws+PTgpIFBQwz
 pokFrA+TYRhrdFRHJWih4350aovGhGvJB65V3RUJIoSUzco2ZsoqslXX93lpvE3VKX
 igBtg/5u03RCA==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Date: Tue, 24 Aug 2021 15:54:24 -0700
Message-Id: <20210824225427.2065517-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 14:24:33 +0000
Subject: [Intel-gfx] [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
disabled -Wsometimes-uninitialized as noisy but there have been a few
fixes to clang that make the false positive rate fairly low so it should
be enabled to help catch obvious mistakes. The first two patches fix
revent instances of this warning then enables it for i915 like the rest
of the tree.

Cheers,
Nathan

Nathan Chancellor (3):
  drm/i915/selftests: Do not use import_obj uninitialized
  drm/i915/selftests: Always initialize err in
    igt_dmabuf_import_same_driver_lmem()
  drm/i915: Enable -Wsometimes-uninitialized

 drivers/gpu/drm/i915/Makefile                        | 1 -
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
-- 
2.33.0

