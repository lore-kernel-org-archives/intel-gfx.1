Return-Path: <SRS0=Fb8f=NE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDE5C432BE
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Aug 2021 20:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2992860560
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Aug 2021 20:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2992860560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B706E8E2;
	Fri, 13 Aug 2021 20:30:49 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0846E8D8
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bt14so4633091ejb.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLapkgrouu6XaESfbyHy/JJUr4UWMSd5aiOH2DnBwAQ=;
 b=Fbg2RVYyByvFDn8OFY8/N9A+jK5dp4VF2+5pBXGZw0jB3mdnzBwTDHoyoU4PNzTiyV
 +tEMEZPa0M6SfkjqupRjpMmWfk0opiRU+/Y/SOCVPTdwV1F3JzTTzuQrwiZucEgcEV3J
 FQdbSf+PkNqYHGxWM3pltzzafw6QsuPkLOlf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLapkgrouu6XaESfbyHy/JJUr4UWMSd5aiOH2DnBwAQ=;
 b=VmKXmzOIc2yy7MysWpfbdeXdcntQbhz+2ZER+VJnbcewAvg75BbhOtoxV2ESUc/TQ3
 OW3cFLOtd3zgRLGBa2I5eHR3v0JVF6ouvAp6eBfSmogFEX+u4sAgUzBGjOfAcz0IMfM+
 5q+hBBG5YGiI6QaraVq7uiL/6VJNJsdk8avJUWowyhbZb62yTnQJNrpb124RAcq3OhIC
 n1UVEdEQc2KmHEiC8WV8WiqkHJqzsQGQIf9VrMxog9Om5We6/Sqp5nRFaIW+eUvEoq3m
 T8AnnN0Ii73G8yVL9cQpuk1wvE57UmLs9sGsAdcuXWsal6Kt7U9OsPv3oVvKVP/afQpW
 a16Q==
X-Gm-Message-State: AOAM530LK6LU05ThveIkcsOFYmIWg8eD+M51oixMWE9c/F41pc+pd7iB
 PQOMFSraqLZcDwybP9gj9HV2qQ==
X-Google-Smtp-Source: ABdhPJxJJf2HJ5EDQPO8aTAM0LBHYuMbe+J1b+lLLRf/Mk/r+FlpIYV2iYqZaZFo72aF+Vo7Xnmp6g==
X-Received: by 2002:a17:906:40d1:: with SMTP id
 a17mr4266373ejk.503.1628886643663; 
 Fri, 13 Aug 2021 13:30:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 13 Aug 2021 22:30:26 +0200
Message-Id: <20210813203033.3179400-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 04/11] drm/i915: Drop code to handle set-vm
 races from execbuf
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

Changing the vm from a finalized gem ctx is no longer possible, which
means we don't have to check for that anymore.

I was pondering whether to keep the check as a WARN_ON, but things go
boom real bad real fast if the vm of a vma is wrong. Plus we'd need to
also get the ggtt vm for !full-ppgtt platforms. Ditching it all seemed
like a better idea.

References: ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e809aca00f72..905b1cbd22d5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -775,11 +775,7 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
 	/* Check that the context hasn't been closed in the meantime */
 	err = -EINTR;
 	if (!mutex_lock_interruptible(&ctx->lut_mutex)) {
-		struct i915_address_space *vm = rcu_access_pointer(ctx->vm);
-
-		if (unlikely(vm && vma->vm != vm))
-			err = -EAGAIN; /* user racing with ctx set-vm */
-		else if (likely(!i915_gem_context_is_closed(ctx)))
+		if (likely(!i915_gem_context_is_closed(ctx)))
 			err = radix_tree_insert(&ctx->handles_vma, handle, vma);
 		else
 			err = -ENOENT;
-- 
2.32.0

