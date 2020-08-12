Return-Path: <SRS0=eb9m=BW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635D6C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 13:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41EBE20829
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 13:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41EBE20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3E6E13D;
	Wed, 12 Aug 2020 13:24:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5D6E109;
 Wed, 12 Aug 2020 13:24:37 +0000 (UTC)
IronPort-SDR: ZdVQzlRv18N1G293eIpbLR7SZbUT3tb6D7SXRz4F/OB9AZlfKLp+Utrrky3IErP0HEmD07hV8h
 kvdg77nyjXHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141569741"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="141569741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 06:24:36 -0700
IronPort-SDR: miMmxn9KccU84+Ewg0KkaAX2MHNnnfZrodgK2LjFKqULhRVO2jOOEuSo5fCgHpEZI71tVtjTit
 +h/oTnDwMKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="295065873"
Received: from cwilli-mobl.ger.corp.intel.com (HELO [10.252.41.147])
 ([10.252.41.147])
 by orsmga006.jf.intel.com with ESMTP; 12 Aug 2020 06:24:33 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <d50eb2e0-75c8-b724-006f-5e7b391961ff@linux.intel.com>
Date: Wed, 12 Aug 2020 15:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Intel-gfx] [PULL] drm-misc-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-08-12:
drm-misc-fixes for v5.9-rc1:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().
The following changes since commit b5ac98cbb8e5e30c34ebc837d1e5a3982d2b5f5c:

  drm: Added orientation quirk for ASUS tablet model T103HAF (2020-08-04 11:45:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-08-12

for you to fetch changes up to 836b194d65782aaec4485a07d2aab52d3f698505:

  drm/virtio: fix memory leak in virtio_gpu_cleanup_object() (2020-08-07 13:59:08 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9-rc1:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().

----------------------------------------------------------------
Qi Liu (1):
      drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()

Xin He (1):
      drm/virtio: fix memory leak in virtio_gpu_cleanup_object()

 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 2 files changed, 2 insertions(+)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
