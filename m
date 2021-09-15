Return-Path: <SRS0=Y9sQ=OF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9A5C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 19:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1E961165
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 19:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1E961165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2776EA03;
	Wed, 15 Sep 2021 19:32:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 753516EA03;
 Wed, 15 Sep 2021 19:32:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6E57BA01BB;
 Wed, 15 Sep 2021 19:32:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 15 Sep 2021 19:32:26 -0000
Message-ID: <163173434644.30118.9170720679818994813@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210915185954.3114858-1-matthew.auld@intel.com>
In-Reply-To: <20210915185954.3114858-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv3=2C01/12=5D_drm/ttm=3A_stop_setti?=
 =?utf-8?q?ng_page-=3Eindex_for_the_ttm=5Ftt?=
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

Series: series starting with [v3,01/12] drm/ttm: stop setting page->index for the ttm_tt
URL   : https://patchwork.freedesktop.org/series/94705/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
13d749649308 drm/ttm: stop setting page->index for the ttm_tt
-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 58aa6622d32a ("drm/ttm: Correctly set page mapping and -index members")'
#11: 
commit 58aa6622d32af7d2c08d45085f44c54554a16ed7

total: 1 errors, 0 warnings, 0 checks, 19 lines checked
625b6c6d2e8a drm/ttm: move ttm_tt_{add, clear}_mapping into amdgpu
437d165efeea drm/ttm: remove TTM_PAGE_FLAG_NO_RETRY
7f778166b103 drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
d5ca5e74a3c8 drm/ttm: add some kernel-doc for TTM_PAGE_FLAG_*
fa296d488d3b drm/ttm: add TTM_PAGE_FLAG_EXTERNAL_MAPPABLE
-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 667a50db0477 ("drm/ttm: Refuse to fault (prime-) imported pages")'
#11: 
commit 667a50db0477d47fdff01c666f5ee1ce26b5264c

total: 1 errors, 0 warnings, 0 checks, 30 lines checked
fc851ac1bf9e drm/i915/gem: Break out some shmem backend utils
6ebd10cc602b drm/i915/ttm: add tt shmem backend
3674047745cb drm/i915/ttm: use cached system pages when evicting lmem
de3f5e9a7e28 drm/i915: try to simplify make_{un}shrinkable
-:164: CHECK:LINE_SPACING: Please don't use multiple blank lines
#164: FILE: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:510:
 
+

total: 0 errors, 0 warnings, 1 checks, 194 lines checked
7b31a03b4172 drm/i915/ttm: make evicted shmem pages visible to the shrinker
7401d4e19fbe drm/i915/ttm: enable shmem tt backend


