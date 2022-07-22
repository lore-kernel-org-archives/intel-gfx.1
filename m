Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FE9C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jul 2022 10:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00DA92D38;
	Fri, 22 Jul 2022 10:00:12 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DDD92D35;
 Fri, 22 Jul 2022 10:00:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3FE4868AFE; Fri, 22 Jul 2022 12:00:08 +0200 (CEST)
Date: Fri, 22 Jul 2022 12:00:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20220722100006.GC14113@lst.de>
References: <20220721174307.1085741-1-bob.beckett@collabora.com>
 <118ae557-a7cb-10b2-9198-2ceb92948dd7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <118ae557-a7cb-10b2-9198-2ceb92948dd7@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: stop using swiotlb
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 kernel@collabora.com, Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 10:13:48AM +0100, Tvrtko Ursulin wrote:
> Christoph - ack from you? Also, if we merge it via the normal process it 
> will hit 5.21 only. Does that work for you?

While I'd like to kill off swiotlb_max_segment rather sooner than
later I'm fine with following the normal process.  But I don't think
there will be a 5.21 with the recent Linux versioning practice :)
