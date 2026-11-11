Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB5606A336
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAU4D/9p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8259E10EA77;
	Wed, 11 Nov 2026 15:30:05 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F23410EA77
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 15:29:59 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b335eeb340so27816997b3.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794410998; x=1795015798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/1u6XeqNpR8iqEVRq9QW6GCzvz7kym3vRXqavn4Y8OU=;
 b=QAU4D/9pz0jMjYyfB/9c63qxPaBP9kcbS1dKz5xPcn/64Mcshbsdi/vX/By0RtW4Hl
 wUixnXmXHvLrZrEIPBlIbDHQfPp/2DsSW9AbDsGiMR3yBXmbj15LKszK5J3Kgy0Q1icw
 Y4zFoAzKiEGJNXMiQ2aU9vmdlbnQs3nYZUTDbI9N/wvor/fj2OoQDimMkDyLSTmulNKY
 DRbLQXlCK0r7zvAqlcjiwISBFWG8FbKJxYNs4SfmF7UWdNACw9yyOhXakyUGWl4Ns4pW
 tZj60IRwJclqI95uOmD+zpovelRurbJavRRhY3OjCJf1clPD5PquISCNxsUzdUduIsuO
 K1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794410998; x=1795015798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/1u6XeqNpR8iqEVRq9QW6GCzvz7kym3vRXqavn4Y8OU=;
 b=faEqjGtfNpX1WWRhAMESi7w8BKo7JaKMjgv0Eb9X6BN45S08ayHk6YvEEorisI09EZ
 64c/cyK/yz5Aw+GYrLtbd+rnEINgIEsHt1ip24AWGVTVkCQjEY1ckf2zSTPukxdMU6rV
 Vuf5keY98ZpQYinnKiOmcv4aUW4Zjmmw+cBCd6i5kEgCCmMLK2iDlcxnfT/xXcDIShG2
 Tsu6MISM7n6gvEo3gaj0zIE09NxDgF2TGPq7dlAkSTnCDGoNZTMppf9CSoCJaChd6i3P
 DwcBJuUSBO8LAfyvBMfMQ8FJa7l+lPDcOC1bp8OmbTim97AT3eAwwtYFtKDhoiVvNTIc
 xDdw==
X-Gm-Message-State: APuU4Z8wY2Mq1+6a45b/2vbPPPws58ib0SVrjoHOVK1myFp44OtnQ79H
 rR+ZVGqKfy+0tEKQLfGsAMB7AOvyadqzK5h4yuv70YuyyOjxj/mJIPhoh7BGJdFE
X-Gm-Gg: AYBFou2A9npTx3i87eiBff6URy5z7L1xbZUGJdMd00eWBDmqc9mdfBO94es+IVl+uFJ
 1Az4kjd+pl4S1IXHj+jFeUsiKplmYPXB9H7Iyhb10rUqQWDM773s9xDyrh3IrPV4/bEFp8gpKLz
 Gg4P9l02XKTNuUACNccHGdbx7BvJYZ27eE3zqmhZBZvOsv9OwxmCpV6Fdex4w/TRzu+Ce1xlrfA
 9jB6PKz6S/g7sWzLVszJMzueUIAt/qtekkpRSPCaQpjsg6W7ovQNeIE+2Tvjo+0/JzdqiSyOiDB
 0IhUKvPh26RpD7feH0U5tCkpyC/RfyOgQrpLiSqvy9OHYGPpx9+h50LqJXs+eggC0QwTxKtm/K4
 ucZBnOQCeGZ7Ir39L5anOLBugn0No91451Cv10896xGC78RQfySbZqCfqEAYTnFJmVOyid5XE8Y
 EVj0K84JuxYCn0QaV4w9SNwvQktnPaeceDdBUh2Y3Zd873wheoFHqeEzYimVWmKKn6wx1cDdEzA
 BqomNTLnHBoNk2ijecAAQbMebvrqVzyZYpoarYvAATQdzlZlc2+Qsms0AaK92HX0cZ0UlqSWQGv
 /XiUg3cGWhT0apnGfKyF57NvdHB7g8OvvgOzVqemJGEo2lrB0CA7QCy2ZRQG
X-Received: by 2002:a05:690c:dc5:b0:8b0:f1c0:60b1 with SMTP id
 00721157ae682-8b3a811009dmr18566677b3.60.1794410998050; 
 Wed, 11 Nov 2026 07:29:58 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39324ba4fsm46601447b3.4.2026.11.11.07.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:29:57 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: javiermv@duck.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH 0/2] drm/i915/guc: Fix requests of a banned context never
 completing
Date: Wed, 11 Nov 2026 15:29:16 +0000
Message-ID: <20261111152916.21300-1-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261110122534.12989-1-javiermv@gmail.com>
References: <20261110122534.12989-1-javiermv@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series is superseded by v2, which fixes the use-after-free in patch 1
and covers exiting contexts in patch 2, both found by the Sashiko review:

https://lore.kernel.org/intel-gfx/20261111135753.11071-1-javiermv@gmail.com/

Please review v2 instead.

Javier MV
