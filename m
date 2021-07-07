Return-Path: <SRS0=YrHI=L7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50334C07E96
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 00:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1259661970
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 00:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1259661970
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9DA6E7EA;
	Wed,  7 Jul 2021 00:47:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADBD6E7EA;
 Wed,  7 Jul 2021 00:47:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209175854"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209175854"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:47:29 -0700
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="647627472"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:47:25 -0700
Date: Wed, 7 Jul 2021 06:19:05 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20210707004904.GD26377@intel.com>
References: <20210705135310.1502437-1-matthew.auld@intel.com>
 <20210705135310.1502437-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210705135310.1502437-5-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/uapi: reject set_domain for
 discrete
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNy0wNSBhdCAxNDo1MzoxMCArMDEwMCwgTWF0dGhldyBBdWxkIHdyb3RlOgo+IFRo
ZSBDUFUgZG9tYWluIHNob3VsZCBiZSBzdGF0aWMgZm9yIGRpc2NyZXRlLCBhbmQgb24gREcxIHdl
IGRvbid0IG5lZWQKPiBhbnkgZmx1c2hpbmcgc2luY2UgZXZlcnl0aGluZyBpcyBhbHJlYWR5IGNv
aGVyZW50LCBzbyByZWFsbHkgYWxsIHRoaXMKPiBkb2VzIGlzIGFuIG9iamVjdCB3YWl0LCBmb3Ig
d2hpY2ggd2UgaGF2ZSBhbiBpb2N0bC4gTG9uZ2VyIHRlcm0gdGhlCj4gZGVzaXJlZCBjYWNoaW5n
IHNob3VsZCBiZSBhbiBpbW11dGFibGUgY3JlYXRpb24gdGltZSBwcm9wZXJ0eSBmb3IgdGhlCj4g
Qk8sIHdoaWNoIGNhbiBiZSBzZXQgd2l0aCBzb21ldGhpbmcgbGlrZSBnZW1fY3JlYXRlX2V4dC4K
PiAKPiBPbmUgb3RoZXIgdXNlciBpcyBpcmlzICsgdXNlcnB0ciwgd2hpY2ggdXNlcyB0aGUgc2V0
X2RvbWFpbiB0byBwcm9iZSBhbGwKPiB0aGUgcGFnZXMgdG8gY2hlY2sgaWYgdGhlIEdVUCBzdWNj
ZWVkcywgaG93ZXZlciBrZWVwaW5nIHRoZSBzZXRfZG9tYWluCj4gYXJvdW5kIGp1c3QgZm9yIHRo
YXQgc2VlbXMgcmF0aGVyIHNjdWZmZWQuIFdlIGNvdWxkIGVxdWFsbHkganVzdCBzdWJtaXQKPiBh
IGR1bW15IGJhdGNoLCB3aGljaCBzaG91bGQgaG9wZWZ1bGx5IGJlIGdvb2QgZW5vdWdoLCBvdGhl
cndpc2UgYWRkaW5nIGEKPiBuZXcgY3JlYXRpb24gdGltZSBmbGFnIGZvciB1c2VycHRyIG1pZ2h0
IGJlIGFuIG9wdGlvbi4gQWx0aG91Z2ggbG9uZ2VyCj4gdGVybSB3ZSB3aWxsIGFsc28gaGF2ZSB2
bV9iaW5kLCB3aGljaCBzaG91bGQgYWxzbyBiZSBhIG5pY2UgZml0IGZvcgo+IHRoaXMsIHNvIGFk
ZGluZyBhIHdob2xlIG5ldyBmbGFnIGlzIGxpa2VseSBvdmVya2lsbC4KPiAKPiB2MjogYWRkIHNv
bWUgbW9yZSBrZXJuZWwgZG9jLCBhbHNvIGFkZCB0aGUgaW1wbGljaXQgcnVsZXMgd2l0aCBjYWNo
aW5nCkxHVE0KClJldmlld2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5j
b20+Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4g
U2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+IENj
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Cj4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4g
Q2M6IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+Cj4gQ2M6IEtlbm5l
dGggR3JhdW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3JnPgo+IENjOiBKYXNvbiBFa3N0cmFuZCA8
amFzb25Aamxla3N0cmFuZC5uZXQ+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gQ2M6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jIHwgIDMgKysr
Cj4gIGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCAgICAgICAgICAgICAgICB8IDE4ICsrKysr
KysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jCj4gaW5kZXggNDMwMDRi
ZWY1NWNiLi5iNjg0YTYyYmYzYjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2RvbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2RvbWFpbi5jCj4gQEAgLTQ5MCw2ICs0OTAsOSBAQCBpOTE1X2dlbV9zZXRfZG9tYWlu
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAl1MzIgd3JpdGVf
ZG9tYWluID0gYXJncy0+d3JpdGVfZG9tYWluOwo+ICAJaW50IGVycjsKPiAgCj4gKwlpZiAoSVNf
REdGWCh0b19pOTE1KGRldikpKQo+ICsJCXJldHVybiAtRU5PREVWOwo+ICsKPiAgCS8qIE9ubHkg
aGFuZGxlIHNldHRpbmcgZG9tYWlucyB0byB0eXBlcyB1c2VkIGJ5IHRoZSBDUFUuICovCj4gIAlp
ZiAoKHdyaXRlX2RvbWFpbiB8IHJlYWRfZG9tYWlucykgJiBJOTE1X0dFTV9HUFVfRE9NQUlOUykK
PiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9pOTE1
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oCj4gaW5kZXggNmY5NGU1ZTc1Njlh
Li5mZDFhOTg3ODczMGMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5o
Cj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oCj4gQEAgLTkwMCw2ICs5MDAsMjQg
QEAgc3RydWN0IGRybV9pOTE1X2dlbV9tbWFwX29mZnNldCB7Cj4gICAqCj4gICAqIEFsbCBvdGhl
ciBkb21haW5zIGFyZSByZWplY3RlZC4KPiAgICoKPiArICogTm90ZSB0aGF0IGZvciBkaXNjcmV0
ZSwgc3RhcnRpbmcgZnJvbSBERzEsIHRoaXMgaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZCwgYW5kCj4g
KyAqIGlzIGluc3RlYWQgcmVqZWN0ZWQuIE9uIHN1Y2ggcGxhdGZvcm1zIHRoZSBDUFUgZG9tYWlu
IGlzIGVmZmVjdGl2ZWx5IHN0YXRpYywKPiArICogd2hlcmUgd2UgYWxzbyBvbmx5IHN1cHBvcnQg
YSBzaW5nbGUgJmRybV9pOTE1X2dlbV9tbWFwX29mZnNldCBjYWNoZSBtb2RlLAo+ICsgKiB3aGlj
aCBjYW4ndCBiZSBzZXQgZXhwbGljaXRseSBhbmQgaW5zdGVhZCBkZXBlbmRzIG9uIHRoZSBvYmpl
Y3QgcGxhY2VtZW50cywKPiArICogYXMgcGVyIHRoZSBiZWxvdy4KPiArICoKPiArICogSW1wbGlj
aXQgY2FjaGluZyBydWxlcywgc3RhcnRpbmcgZnJvbSBERzE6Cj4gKyAqCj4gKyAqCS0gSWYgYW55
IG9mIHRoZSBvYmplY3QgcGxhY2VtZW50cyAoc2VlICZkcm1faTkxNV9nZW1fY3JlYXRlX2V4dF9t
ZW1vcnlfcmVnaW9ucykKPiArICoJICBjb250YWluIEk5MTVfTUVNT1JZX0NMQVNTX0RFVklDRSB0
aGVuIHRoZSBvYmplY3Qgd2lsbCBiZSBhbGxvY2F0ZWQgYW5kCj4gKyAqCSAgbWFwcGVkIGFzIHdy
aXRlLWNvbWJpbmVkIG9ubHkuCj4gKyAqCj4gKyAqCS0gRXZlcnl0aGluZyBlbHNlIGlzIGFsd2F5
cyBhbGxvY2F0ZWQgYW5kIG1hcHBlZCBhcyB3cml0ZS1iYWNrLCB3aXRoIHRoZQo+ICsgKgkgIGd1
YXJhbnRlZSB0aGF0IGV2ZXJ5dGhpbmcgaXMgYWxzbyBjb2hlcmVudCB3aXRoIHRoZSBHUFUuCj4g
KyAqCj4gKyAqIE5vdGUgdGhhdCB0aGlzIGlzIGxpa2VseSB0byBjaGFuZ2UgaW4gdGhlIGZ1dHVy
ZSBhZ2Fpbiwgd2hlcmUgd2UgbWlnaHQgbmVlZAo+ICsgKiBtb3JlIGZsZXhpYmlsaXR5IG9uIGZ1
dHVyZSBkZXZpY2VzLCBzbyBtYWtpbmcgdGhpcyBhbGwgZXhwbGljaXQgYXMgcGFydCBvZiBhCj4g
KyAqIG5ldyAmZHJtX2k5MTVfZ2VtX2NyZWF0ZV9leHQgZXh0ZW5zaW9uIGlzIHByb2JhYmxlLgo+
ICAgKi8KPiAgc3RydWN0IGRybV9pOTE1X2dlbV9zZXRfZG9tYWluIHsKPiAgCS8qKiBAaGFuZGxl
OiBIYW5kbGUgZm9yIHRoZSBvYmplY3QuICovCj4gLS0gCj4gMi4yNi4zCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxp
c3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
