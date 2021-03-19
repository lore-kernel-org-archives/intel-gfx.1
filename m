Return-Path: <SRS0=r5PR=IR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2626C433C1
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 22:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8640C6197F
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 22:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8640C6197F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jlekstrand.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7F76EAE1;
	Fri, 19 Mar 2021 22:39:02 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93C6EADF
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 22:39:01 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 mz6-20020a17090b3786b02900c16cb41d63so5549262pjb.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 15:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nUHSQDuv2nJRjl++0dYVykG+R6J43ojPD/DL6BK+Q=;
 b=CHGLBFyy7SkKsZBjNsxrP1ViIZYD1uCnhKrQNvCweYZrafdte9QLhKHBHK9Nfe3t7l
 CZhhhsWTvok/0zXY0tOfyX6/9js6DoESiZZJh4eIXPtHRf9qnT++gPYJYeFMGTv4iZp9
 ETWRETvZActaH8ogRbQIEB6FS1WWDk9jCSbXsPwNcT3SrkdxdUsmB6NYwUtPnL4VCV4M
 Dt4B5QPRLjL4zoj1FvYNz6vC9ARzBTQ2Mcxfc8upYmtE82pqD720ChuNJV5irAR2pUpm
 fZPTbCkd13/lCVfX4WUe76xVRPGdNlwt1cPS9igond8AJqbA/nZxTeM0Zbr8epLhhub+
 H5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nUHSQDuv2nJRjl++0dYVykG+R6J43ojPD/DL6BK+Q=;
 b=gbHkW4Bv6m6z+dN7usVq08SKoRn7TEDv329zmkdRcQMaMITWrTc/bAgszGOs8zuvvW
 xjT19kIqQt83Mir3b/Lfxv3n3SBuSowIAwO3OUDuxCUfj7pNNycIsAVzVX3AYt/QPy4W
 WCdpYLoh1FnZ/YWM0xEhCJ4C6RmDst3mb1cKBSeBgN6Gi/p1bxBgFDGHX6Unks4STYiF
 sUh3uVdSsG8cmaLmzWVbomo034BbqZRcSp1eqrfwZBqbmBG6/4c7dTF/297OFVkGgU6M
 poKZovgFJYh6TJImkHK78hL3TZdW7TtJ4FzyRlZ8jvTzCubrdg8seGVBpjW0BUs6ZeWe
 6gCw==
X-Gm-Message-State: AOAM531cAC+f33xhBkROPt65YlvWn0vZchXxsXCGB7TSJqaMovFl/g40
 TEUupHB7TbA2tqDZsnsjyFT8Vml+rOXN3Q==
X-Google-Smtp-Source: ABdhPJwnQdRKd8jvQa2+zaX2oIUapI4sEkTdPzBRem7XT5mRyn7KzUaAaGNd6QAy1DTW++xWemKZAA==
X-Received: by 2002:a17:902:aa0a:b029:e4:c090:ad76 with SMTP id
 be10-20020a170902aa0ab02900e4c090ad76mr16676589plb.2.1616193540928; 
 Fri, 19 Mar 2021 15:39:00 -0700 (PDT)
Received: from omlet.com ([134.134.137.77])
 by smtp.gmail.com with ESMTPSA id a20sm6809206pfl.97.2021.03.19.15.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 15:39:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Fri, 19 Mar 2021 17:38:52 -0500
Message-Id: <20210319223856.2983244-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: uAPI clean-ups part 2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patch series is the second installment of my quest to clean up the
i915 uAPI.  The first three patches delete interfaces which have only ever
been used by i-g-t and never any real userspace.  In the case of NO_ZEROMAP,
it's unclear exactly how this happened.  There were userspace patches for
it back in the day, they just never landed.  For the others, there was
never any userspace beyond i-g-t and they never should have landed in the
first place.

The last patch moves the SINGLE_TIMELINE API to an emulation using syncobj
to help simplify some of our locking infrastructure.

Test-with: 20210319223233.2982842-1-jason@jlekstrand.net

Jason Ekstrand (4):
  drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
  drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
  drm/i915: Drop the CONTEXT_CLONE API
  drm/i915: Implement SINGLE_TIMELINE with a syncobj

 drivers/gpu/drm/i915/Makefile                 |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 372 ++----------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   9 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  23 +-
 drivers/gpu/drm/i915/gt/intel_context_param.c |  63 ---
 drivers/gpu/drm/i915/gt/intel_context_param.h |  14 -
 include/uapi/drm/i915_drm.h                   |  40 +-
 7 files changed, 55 insertions(+), 467 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.h

-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
