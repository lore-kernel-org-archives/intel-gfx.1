Return-Path: <SRS0=EfQN=KS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7664C47080
	for <intel-gfx@archiver.kernel.org>; Sun, 23 May 2021 02:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B7B61175
	for <intel-gfx@archiver.kernel.org>; Sun, 23 May 2021 02:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B7B61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68D96E02E;
	Sun, 23 May 2021 02:29:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13EC66E15A;
 Sun, 23 May 2021 02:29:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0A5B8A00C9;
 Sun, 23 May 2021 02:29:36 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Date: Sun, 23 May 2021 02:29:36 -0000
Message-ID: <162173697601.21638.6507321143525300691@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210523022125.853214-1-linux@roeck-us.net>
In-Reply-To: <20210523022125.853214-1-linux@roeck-us.net>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gem=3A_Use_list=5Fentry_to_access_list_members?=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/gem: Use list_entry to access list members
URL   : https://patchwork.freedesktop.org/series/90449/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
ea9ca76d0bd2 drm/i915/gem: Use list_entry to access list members
-:22: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#22: FILE: drivers/gpu/drm/i915/gvt/dmabuf.c:152:
+			dmabuf_obj = list_entry(pos,
 					struct intel_vgpu_dmabuf_obj, list);

-:34: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!dmabuf_obj->info"
#34: FILE: drivers/gpu/drm/i915/gvt/dmabuf.c:361:
+		if (dmabuf_obj->info == NULL)

total: 0 errors, 0 warnings, 2 checks, 41 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
